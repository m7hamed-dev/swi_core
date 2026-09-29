import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swi_core/swi_core.dart';

void main() {
  group('Result', () {
    test('a success folds to its value and carries the status code', () {
      const result = Right<int>(result: 42, statusCode: 200);

      expect(result.fold(onRight: (v) => 'got $v', onLeft: (m) => 'failed: $m'), 'got 42');
      expect(result.code, 200);
      expect(result.data, 42);
    });

    test('a failure folds to its message', () {
      const result = Left<int>(message: 'no route to host', statusCode: 503);

      expect(result.fold(onRight: (v) => 'got $v', onLeft: (m) => 'failed: $m'), 'failed: no route to host');
      expect(result.code, 503);
      expect(result.data, isNull);
    });
  });

  group('status codes', () {
    test('the ranges split the way HTTP defines them', () {
      expect(200.isOk, isTrue);
      expect(299.isOk, isTrue);
      expect(300.isOk, isFalse);
      expect(404.isClientError, isTrue);
      expect(500.isServerError, isTrue);
      expect(499.isServerError, isFalse);
    });

    test('a missing code is not a success', () {
      expect(isSucces(null), isFalse);
      expect(isSucces(201), isTrue);
    });
  });

  group('DioMakeRequest', () {
    test('offline short-circuits before the call is made', () async {
      var called = false;
      const runner = DioMakeRequest(networkStatus: _Offline(), offlineMessage: 'لا يوجد اتصال');

      final result = await runner<int>(() async {
        called = true;
        return const APiResposnseSuccess(code: 200, value: <String, dynamic>{}, message: '');
      }, (_) => 1);

      expect(called, isFalse, reason: 'no request goes out while offline');
      expect(result, isA<Left<int>>());
      expect(result.msg, 'لا يوجد اتصال');
    });

    test('a 2xx response is parsed into a Right', () async {
      const runner = DioMakeRequest(networkStatus: _Online());

      final result = await runner<String>(
        () async => const APiResposnseSuccess(code: 200, value: {'name': 'وحدة'}, message: 'ok'),
        (data) => data['name'] as String,
      );

      expect(result.fold(onRight: (v) => v, onLeft: (m) => m), 'وحدة');
      expect(result.code, 200);
    });

    test('a non-2xx response becomes a Left carrying the server message', () async {
      const runner = DioMakeRequest(networkStatus: _Online());

      final result = await runner<String>(
        () async => const APiResponseError(code: 422, error: 'الرقم مستخدم'),
        (data) => data['name'] as String,
      );

      expect(result, isA<Left<String>>());
      expect(result.msg, 'الرقم مستخدم');
      expect(result.code, 422);
    });

    test('a throwing parser is turned into a message, not an exception', () async {
      const runner = DioMakeRequest(networkStatus: _Online());

      final result = await runner<String>(
        () async => const APiResposnseSuccess(code: 200, value: <String, dynamic>{}, message: 'ok'),
        (data) => data['missing'] as String,
      );

      expect(result, isA<Left<String>>());
      expect(result.msg, isNotEmpty);
    });
  });

  group('SmartHandler', () {
    test('collects the per-field validation errors a Laravel reply carries', () {
      final handler = SmartHandler.fromJson(const {
        'success': false,
        'message': 'خطأ في التحقق',
        'data': {
          'phonenumber': ['الرقم مستخدم', 'الرقم قصير'],
          'name': 'الاسم مطلوب',
        },
      });

      expect(handler.success, isFalse);
      expect(handler.firstErrorOf('phonenumber'), 'الرقم مستخدم');
      expect(handler.errors['name'], ['الاسم مطلوب']);
      expect(handler.firstError, isNotNull);
    });

    test('a reply with no error map yields no errors', () {
      final handler = SmartHandler.fromJson(const {'success': true, 'message': 'ok', 'data': null});

      expect(handler.errors, isEmpty);
      expect(handler.firstError, isNull);
    });
  });

  group('ServerErrorMessage', () {
    test("Laravel's validation shape: the field errors, one per line", () {
      const body = {
        'message': 'The serial number has already been taken. (and 1 more error)',
        'errors': {
          'serial_number': ['الرقم التسلسلي مستخدم من قبل'],
          'image': ['الصورة مطلوبة'],
        },
      };

      expect(ServerErrorMessage.from(body, 422), 'الرقم التسلسلي مستخدم من قبل\nالصورة مطلوبة');
    });

    test('field errors under data, as SmartHandler reads them', () {
      const body = {
        'success': false,
        'message': 'validation error',
        'data': {'name': 'الاسم مطلوب'},
      };

      expect(ServerErrorMessage.from(body, 422), 'الاسم مطلوب');
    });

    test('only a message: the message', () {
      expect(ServerErrorMessage.from(const {'success': false, 'message': 'الحافظة مرتبطة بمتجر', 'data': null}, 400),
          'الحافظة مرتبطة بمتجر');
    });

    test('an HTML page or an empty reply falls back to the status', () {
      expect(ServerErrorMessage.from('<html>413 Request Entity Too Large</html>', 413), 'حجم الملف أكبر من المسموح به');
      expect(ServerErrorMessage.from(const {'message': ''}, 500), 'حدث خطأ في الخادم (500)');
      expect(ServerErrorMessage.from(null, null), 'تعذر الاتصال بالخادم');
    });
  });

  group('DioConsumer with a refused request', () {
    Future<APiResponse> post(int status, Object body, {bool throwOnError = true}) {
      final dio = Dio(BaseOptions(validateStatus: throwOnError ? null : (_) => true))
        ..httpClientAdapter = _Reply(status, body);
      return DioConsumer(dio: dio).post('/refrigerators/create', body: const {});
    }

    test("keeps the server's reason and its status code", () async {
      final response = await post(422, const {
        'message': 'The given data was invalid.',
        'errors': {
          'serial_number': ['الرقم التسلسلي مستخدم من قبل'],
        },
      });

      // It used to be an empty message with the code 0.
      expect(response.msg, 'الرقم التسلسلي مستخدم من قبل');
      expect(response.statusCode, 422);
    });

    test('an HTML error page reads as a sentence for its status', () async {
      final response = await post(500, '<!DOCTYPE html><html>Server Error</html>');

      expect(response.msg, 'حدث خطأ في الخادم (500)');
      expect(response.statusCode, 500);
    });

    test('a returned error response gives the reason, not the HTTP phrase', () async {
      final response = await post(422, const {'message': 'البيانات غير مكتملة'}, throwOnError: false);

      expect(response.msg, 'البيانات غير مكتملة');
      expect(response.statusCode, 422);
    });

    test('reaches the caller as a Left with that reason', () async {
      const runner = DioMakeRequest(networkStatus: _Online());

      final result = await runner<Object?>(
        () => post(403, const {'message': 'ليس لديك صلاحية الإضافة'}),
        (data) => data,
      );

      expect(result, isA<Left<Object?>>());
      expect(result.msg, 'ليس لديك صلاحية الإضافة');
      expect(result.code, 403);
    });
  });

  test('APiResponse classifies itself by status', () {
    const ok = APiResposnseSuccess(code: 204, value: 1, message: 'done');
    const bad = APiResponseError(code: 500, error: 'boom');

    expect(ok.isSuccess, isTrue);
    expect(bad.isServerError, isTrue);
    expect(bad.isSuccess, isFalse);
  });
}

class _Online implements NetworkStatus {
  const _Online();

  @override
  Future<bool> get isConnected async => true;
}

class _Offline implements NetworkStatus {
  const _Offline();

  @override
  Future<bool> get isConnected async => false;
}

/// Answers every request with [status] and [body], like the server.
class _Reply implements HttpClientAdapter {
  _Reply(this.status, this.body);
  final int status;
  final Object body;

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    final isText = body is String;
    return ResponseBody.fromString(
      isText ? body as String : jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [isText ? 'text/html' : Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
