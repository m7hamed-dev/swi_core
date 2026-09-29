/// The sentence to show for a request the server refused, taken from its own
/// reply wherever it put it.
///
/// The reasons used to be read from `data` alone, so a reply carrying them
/// in `errors` (Laravel's validation shape) or only in `message` came out as
/// an empty string, and the apps said nothing more than "حدث خطأ".
class ServerErrorMessage {
  const ServerErrorMessage._();

  /// Field errors first, as they are the most specific, one per line; then
  /// the reply's `message`; then plain text; and last a sentence for
  /// [statusCode], for a reply with nothing readable such as an HTML page.
  static String from(Object? body, int? statusCode) {
    if (body is Map) {
      final reasons = {..._texts(body['errors']), ..._texts(body['data'])};
      if (reasons.isNotEmpty) return reasons.join('\n');
      for (final key in const ['message', 'msg', 'error']) {
        final value = body[key];
        if (value is String && value.trim().isNotEmpty) return value.trim();
      }
    } else if (body is String) {
      final text = body.trim();
      // A web server's error page is HTML, not a sentence.
      if (text.isNotEmpty && !text.startsWith('<')) return text;
    }
    return byStatus(statusCode);
  }

  /// A sentence for a status code alone.
  static String byStatus(int? statusCode) => switch (statusCode) {
    400 => 'الطلب غير صالح',
    401 => 'انتهت الجلسة، سجل الدخول من جديد',
    403 => 'ليس لديك صلاحية لهذا الإجراء',
    404 => 'العنصر المطلوب غير موجود',
    413 => 'حجم الملف أكبر من المسموح به',
    422 => 'البيانات المدخلة غير صالحة',
    429 => 'طلبات كثيرة، حاول بعد قليل',
    final code? when code >= 500 => 'حدث خطأ في الخادم ($code)',
    final code? => 'تعذر إتمام الطلب ($code)',
    null => 'تعذر الاتصال بالخادم',
  };

  /// Every non-empty string in a field-errors value: a string, a list of
  /// them, or a map of field names to either.
  static Iterable<String> _texts(Object? value) sync* {
    if (value is String) {
      if (value.trim().isNotEmpty) yield value.trim();
    } else if (value is List) {
      for (final item in value) {
        yield* _texts(item);
      }
    } else if (value is Map) {
      for (final item in value.values) {
        yield* _texts(item);
      }
    }
  }
}
