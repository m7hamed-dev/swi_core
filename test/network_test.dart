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
