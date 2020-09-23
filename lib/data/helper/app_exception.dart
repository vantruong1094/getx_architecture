
import 'package:dio/dio.dart';
import 'package:getx_demo/data/helper/error_response.dart';
import 'package:getx_demo/utils/constants.dart';
import 'package:getx_demo/extentions/string_ext.dart';

import '../../utils/constants.dart';

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
      : super(Constants.ERROR_TITLE, "Constants.ERROR_MESSAGE_NETWORK");
}

class UnauthorizedErrorException extends AppException {
  UnauthorizedErrorException() : super(Constants.ERROR_TITLE, "401 Unauthorized");

}

AppException handleError(dynamic e) {
  if (e is! DioError) return NoNetworkException();
  final DioError error = e as DioError;

  if (error.isUnauthorized()) {
    return UnauthorizedErrorException();
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

    try {
      final ErrorResponse errResponse = ErrorResponse.fromJson(response.data);
      final String title = errResponse?.statusCode.toString();
      final String message = errResponse?.message;
      if (message.isNullOrEmpty()) {
        return NoNetworkException();
      }
      return AppException(title, message);
    } catch (e) {
      return NoNetworkException();
    }
  }
}