import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_exception.freezed.dart';

@freezed
abstract class DataException with _$DataException {
  const factory DataException.connectionError() = ConnectionError;
  const factory DataException.timeoutError() = TimeoutError;
  const factory DataException.unauthorizedError(int codeError) =
      UnauthorizedError;
  const factory DataException.customError(String message) = CustomError;
  const factory DataException.unexpectedError({UnexpectedErrorDto? data}) =
      UnexpectedError;
  const factory DataException.unProcessableRequest(
    int httpCode,
    UnProcessableRequestDto data,
  ) = UnProcessableRequest;
}
