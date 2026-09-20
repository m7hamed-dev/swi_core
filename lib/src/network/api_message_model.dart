import 'package:swi_core/src/network/smart_handler.dart';

class APIMessageHandler {
  const APIMessageHandler({this.message = defaultErrorMessage});
  static const String defaultErrorMessage = 'حدث خطا ما';
  final String message;

  factory APIMessageHandler.fromJson(Map<String, dynamic> json) {
    final smartHandler = SmartHandler.fromJson(json);
    return APIMessageHandler(message: smartHandler.errors.values.join(' , '));
  }
}
