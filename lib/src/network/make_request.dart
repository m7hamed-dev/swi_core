import 'package:swi_core/src/network/api_response.dart';
import 'package:swi_core/src/network/result.dart';

abstract class MakeRequest {
  Future<Result<T>> call<T>(
    Future<APiResponse> Function() request,
    T Function(Map<String, dynamic> data) parser,
  );
}
