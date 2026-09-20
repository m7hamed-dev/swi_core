class APiResponse<T> {
  const APiResponse({required this.statusCode, required this.data, required this.msg});

  final int statusCode;
  final T data;
  final String msg;

  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  bool get isClientError => statusCode >= 400 && statusCode < 500;

  bool get isServerError => statusCode >= 500 && statusCode < 600;

  String get userFriendlyMessage {
    if (isSuccess) return msg;
    if (isClientError) return 'Client Error: $msg';
    if (isServerError) return 'Server Error: $msg';
    return 'Unknown Error: $msg';
  }
}

class APiResponseError extends APiResponse<String> {
  const APiResponseError({required this.code, required this.error}) : super(statusCode: code, data: error, msg: error);

  final int code;
  final String error;

  @override
  String get userFriendlyMessage {
    return 'Error: $error';
  }
}

class APiResposnseSuccess<T> extends APiResponse<T> {
  const APiResposnseSuccess({required this.code, required this.value, required this.message})
    : super(statusCode: code, data: value, msg: message);

  final int code;
  final T value;
  final String message;

  @override
  String get userFriendlyMessage {
    return 'Success: $message';
  }
}
