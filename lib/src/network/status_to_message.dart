import 'package:swi_core/src/network/status_code.dart';

class StatusToMessage {
  static StatusCode toMessage(int statusCode) {
    return switch (statusCode) {
      200 => const StatusCode(short: 'OK', long: 'The request has succeeded.'),
      201 => const StatusCode(
        short: 'Created',
        long: 'العملية تمت بنجاح وتم إنشاء مورد جديد.',
      ),
      401 => const StatusCode(
        short: 'Unauthorized',
        long: 'لا توجد بيانات مصادقة صالحة.',
      ),
      404 => const StatusCode(
        short: 'Not Found',
        long:
            'هذا المورد غير متاح. يمكن أن يكون قد تم حذفه أو أنه لم يعد متاحًا.',
      ),
      422 => const StatusCode(
        short: 'Fields Are Required',
        long: 'All fields are required.',
      ),
      500 => const StatusCode(
        short: 'Internal Server Error',
        long: 'حدث خطأ داخلي في الخادم أثناء معالجة الطلب.',
      ),
      502 => const StatusCode(
        short: 'Bad Gateway',
        long:
            'The server was acting as a gateway or proxy and received an invalid response from the upstream server.',
      ),
      503 => const StatusCode(
        short: 'Service Unavailable',
        long:
            'The server is currently unavailable (because it is overloaded or down for maintenance).',
      ),
      504 => const StatusCode(
        short: 'Gateway Timeout',
        long:
            'The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.',
      ),
      _ => const StatusCode(
        short: 'Error',
        long: 'An error occurred while processing the request.',
      ),
    };
  }
}
