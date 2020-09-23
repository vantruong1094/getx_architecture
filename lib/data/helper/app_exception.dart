
import 'package:dio/dio.dart';
import 'package:getx_demo/utils/constants.dart';
import 'package:getx_demo/extentions/string_ext.dart';

class AppException implements Exception {
  final String title;
  final String message;

  AppException(this.title, this.message);

}

class NoNetworkException extends AppException {
  NoNetworkException()
      : super(Constants.ERROR_TITLE, Constants.ERROR_MESSAGE_NETWORK);
}

class NoHandleErrorException extends AppException {
  NoHandleErrorException()
      : super(Constants.ERROR_TITLE, Constants.ERROR_MESSAGE_NETWORK);
}

AppException handleError(dynamic e) {
  if (e is! DioError) return NoNetworkException();
  final DioError error = e as DioError;

  if (error.isUnauthorized()) {
    return NoHandleErrorException();
  } else if (error.isMaintenance()) {
    return NoHandleErrorException();
  }

  return error.parseError();
}

extension DioErrorExt on DioError {
  static const CODE_UNAUTHORIZED = 401;
  static const CODE_MAINTENANCE = 503;

  bool isNetworkError() => type != DioErrorType.RESPONSE;

  bool isUnauthorized() => response?.statusCode == CODE_UNAUTHORIZED;

  bool isMaintenance() => response?.statusCode == CODE_MAINTENANCE;

  AppException parseError() {
    if (isNetworkError() || response.data is! Map<String, dynamic>) {
      return NoNetworkException();
    }
//
//    try {
//      final ErrorDetailResponse errResponse = ErrorDetailResponse.fromJson(response.data);
//      final String title = errResponse?.errorCode.toString();
//      final String message = errResponse?.errorMessage;
//      if (message.isNullOrEmpty()) {
//        return NoNetworkException();
//      }
//      return AppException(title, message);
//    } catch (e) {
//      return NoNetworkException();
//    }
  }
}