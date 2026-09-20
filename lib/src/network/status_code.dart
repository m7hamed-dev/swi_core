/// A status code's short English name and its Arabic explanation.
class StatusCode {
  const StatusCode({required this.short, required this.long});

  final String short;
  final String long;
}

extension StatusCodeRanges on int {
  bool get isOk => this >= 200 && this < 300;
  bool get isClientError => this >= 400 && this < 500;
  bool get isServerError => this >= 500 && this < 600;
}

/// Whether a response code means the call worked. Null counts as failure:
/// a response with no code never completed.
bool isSucces(int? statusCode) => statusCode != null && statusCode.isOk;
