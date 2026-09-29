import 'package:dio/dio.dart';
import 'package:swi_core/src/network/general_exceptions.dart';
import 'package:swi_core/src/network/server_error_message.dart';

class ExceptionToMessage {
  static String message(dynamic ex) {
    final msg = ex is DioException ? _handleDioException(ex) : GeneralExceptions.handler(ex);
    return msg;
  }

  static String _handleDioException(DioException ex) {
    final response = ex.response;
    // The server answered: its own reason, wherever it put it.
    if (response != null) return ServerErrorMessage.from(response.data, response.statusCode);
    return 'حدث خطأ في الاتصال بالخادم';
  }
}
