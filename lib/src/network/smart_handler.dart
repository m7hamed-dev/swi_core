class SmartHandler {
  const SmartHandler({
    required this.success,
    required this.message,
    required this.errors,
  });
  final bool success;
  final String message;
  final Map<String, List<String>> errors;

  factory SmartHandler.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return SmartHandler(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      errors: _parseErrors(data),
    );
  }

  static Map<String, List<String>> _parseErrors(dynamic data) {
    if (data == null || data is! Map<String, dynamic>) return {};

    final Map<String, List<String>> result = {};

    data.forEach((key, value) {
      if (value is List) {
        result[key] = value.map((e) => e.toString()).toList();
      } else if (value is String) {
        result[key] = [value];
      } else {
        result[key] = [value.toString()];
      }
    });

    return result;
  }

  /// Get first error message for a specific field (ex: phonenumber)
  String? firstErrorOf(String field) {
    final list = errors[field];
    if (list == null || list.isEmpty) return null;
    return list.first;
  }

  /// Get first error message in all fields
  String? get firstError {
    if (errors.isEmpty) return null;
    return errors.values.first.first;
  }
}

extension CleanMessage on dynamic {
  String cleanMessage({List<String> removerList = const []}) {
    String text = toString();

    for (final item in removerList) {
      text = text.replaceAll(item, '');
    }
    text = text.replaceAll(RegExp(r'\s+'), ' OP ').trim();

    return text;
  }
}
