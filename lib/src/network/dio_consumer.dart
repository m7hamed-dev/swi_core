import 'package:dio/dio.dart';
import 'package:swi_core/src/network/api_response.dart';
import 'package:swi_core/src/network/api_consumer.dart';
import 'package:swi_core/src/network/status_code.dart';
import 'package:swi_core/src/network/exception_to_message.dart';
import 'package:swi_core/src/network/api_message_model.dart';

class DioConsumer implements ApiConsumer<APiResponse> {
  const DioConsumer({required this.dio});
  final Dio dio;

  @override
  Future<APiResponse> delete({
    required String path,
    required String id,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<APiResponse> find(String path, {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      if (isSucces(response.statusCode)) return _resposnseSuccess(response);
      return _responseError(response);
    } catch (e) {
      return _exceptionError(e);
    }
  }

  @override
  Future<APiResponse> findOne({
    required String path,
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<APiResponse> post(
    String path, {
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.post(path, data: body);
      if (isSucces(response.statusCode)) return _resposnseSuccess(response);
      return _responseError(response);
    } catch (e) {
      return _exceptionError(e);
    }
  }

  @override
  Future<APiResponse> update(
    String path, {
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await dio.put(path, data: body);
      if (isSucces(response.statusCode)) return _resposnseSuccess(response);
      return _responseError(response);
    } catch (e) {
      return _exceptionError(e);
    }
  }

  APiResposnseSuccess<dynamic> _resposnseSuccess(Response<dynamic> response) {
    final int statusCode = response.statusCode ?? 200;
    return APiResposnseSuccess(
      value: response.data,
      code: statusCode,
      message: APIMessageHandler.fromJson(response.data).message,
    );
  }

  APiResponseError _exceptionError(Object e) {
    return APiResponseError(error: ExceptionToMessage.message(e), code: 000);
  }

  APiResponseError _responseError(Response<dynamic> response) {
    return APiResponseError(error: response.statusMessage ?? 'Error', code: response.statusCode ?? 500);
  }

  bool isSucces(int? statusCode) {
    if (statusCode == null) return false;
    return statusCode.isOk;
  }
}
