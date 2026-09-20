import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

/// Handles general exceptions and converts them to user-friendly messages.
///
/// Logs exceptions using structured logging and returns
/// appropriate error messages for different exception types.
class GeneralExceptions {
  /// Handles an exception and returns a user-friendly error message.
  ///
  /// Logs the exception for debugging purposes and returns
  /// a localized error message based on the exception type.
  static String handler(dynamic ex) {
    return switch (ex) {
      SocketException() => 'No Internet Connection',
      HttpException() => 'No Service Found',
      FormatException() => 'Invalid Data Format',
      TimeoutException() => 'Request Time Out',
      IOException() => 'حدث مشكلة اثناء رفع ملفات على السيرفر',
      DioException() => 'Dio Exception',
      _ => 'UnKnown Error: ${ex.toString()}',
    };
  }
}
