import 'package:dio/dio.dart';
import 'package:swi_core/src/network/general_exceptions.dart';
import 'package:swi_core/src/network/api_message_model.dart';

class ExceptionToMessage {
  static String message(dynamic ex) {
    final msg = ex is DioException ? _handleDioException(ex) : GeneralExceptions.handler(ex);
    return msg;
  }

  static String _handleDioException(DioException ex) {
    try {
      if (ex.response?.data != null) {
        return APIMessageHandler.fromJson(ex.response?.data).message;
      }
      return 'حدث خطأ في الاتصال بالخادم';
    } catch (e) {
      return 'حدث خطأ غير متوقع';
    }
  }
}
