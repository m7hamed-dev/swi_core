/// The outcome of one call: a value, or a message saying why there is none.
///
/// Consumed with [fold] so neither branch can be forgotten.
abstract class Result<T> {
  const Result({this.data, this.msg = '', this.code = 0});

  final T? data;
  final String msg;

  /// HTTP status the call came back with, or 0 when it never reached the wire.
  final int code;

  R fold<R>({required R Function(T data) onRight, required R Function(String msg) onLeft});
}

/// The call succeeded and carried [result] back.
class Right<T> extends Result<T> {
  const Right({required this.result, this.statusCode = 0}) : super(data: result, code: statusCode);

  final T result;
  final int statusCode;

  @override
  R fold<R>({required R Function(T data) onRight, required R Function(String msg) onLeft}) => onRight(result);
}

/// The call failed; [msg] is already fit to show a user.
class Left<T> extends Result<T> {
  const Left({this.statusCode = 0, String message = ''}) : super(msg: message, code: statusCode);

  final int statusCode;

  @override
  R fold<R>({required R Function(T data) onRight, required R Function(String msg) onLeft}) => onLeft(msg);
}
