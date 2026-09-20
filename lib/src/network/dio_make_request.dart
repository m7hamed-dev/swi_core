import 'package:swi_core/src/network/api_response.dart';
import 'package:swi_core/src/network/exception_to_message.dart';
import 'package:swi_core/src/network/make_request.dart';
import 'package:swi_core/src/network/network_status.dart';
import 'package:swi_core/src/network/result.dart';

/// Runs one call and folds everything that can go wrong into a [Left].
///
/// The connectivity check and the offline message are injected rather than
/// reached for through a service locator, so this class has no opinion about
/// how the app wires itself up.
class DioMakeRequest implements MakeRequest {
  const DioMakeRequest({required this.networkStatus, this.offlineMessage = 'لا يوجد اتصال بالإنترنت'});

  final NetworkStatus networkStatus;
  final String offlineMessage;

  @override
  Future<Result<T>> call<T>(
    Future<APiResponse> Function() request,
    T Function(Map<String, dynamic> data) parser,
  ) async {
    try {
      if (!await networkStatus.isConnected) return Left(message: offlineMessage);

      final response = await request();
      if (response.isSuccess) {
        return Right(result: parser(response.data), statusCode: response.statusCode);
      }
      return Left(message: response.msg, statusCode: response.statusCode);
    } catch (e) {
      return Left(message: ExceptionToMessage.message(e));
    }
  }
}
