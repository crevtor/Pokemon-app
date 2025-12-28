import 'dart:io';

import 'package:pokemon/core/resources/export.resources.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'failure.dart';
import 'model/base_response_model.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  UNKNOWN,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  VALIDATION_FAILED,
  CONFLICT_RESPONSE
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      //dio error so it is error from response
      failure = _handleError(error);
    } else if (error is SocketException) {
      failure = DataSource.NO_INTERNET_CONNECTION.getFailure();
    } else {
      // default error
      failure = DataSource.UNKNOWN.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioExceptionType.badResponse:
        // final headers = error.requestOptions.headers;
        // final contentType = headers['Content-Type'];
        // if (contentType != null && !contentType.contains('application/json')) {
        //   // If request header does not indicate JSON, throw an exception or handle it accordingly
        //   return DataSource.UNKNOWN.getFailure();
        // }
        late final BaseResponse authError;
        try {
          authError = BaseResponse.fromJson(error.response?.data);
        } catch (error) {
          return DataSource.UNKNOWN.getFailure();
        }

        debugPrint(error.response?.data.toString());

        switch (error.response?.statusCode) {
          case ResponseCode.CONFLICT_RESPONSE:
            return DataSource.CONFLICT_RESPONSE.getFailure(authError.message);
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure(authError.message);
          case ResponseCode.VALIDATION_FAILED:
            return DataSource.VALIDATION_FAILED.getFailure(authError.message);
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure(authError.message);
          case ResponseCode.UNAUTHORIZED:
            return DataSource.UNAUTHORIZED.getFailure(authError.message);
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure(authError.message);
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR
                .getFailure(authError.message);
          default:
            return DataSource.UNKNOWN.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        return DataSource.NO_INTERNET_CONNECTION.getFailure();
      case DioExceptionType.unknown:
        return DataSource.UNKNOWN.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure([String? message]) {
    switch (this) {
      case DataSource.VALIDATION_FAILED:
        return Failure(ResponseCode.VALIDATION_FAILED,
            message ?? ResponseMessage.VALIDATION_FAILED);
      case DataSource.BAD_REQUEST:
        return Failure(
            ResponseCode.BAD_REQUEST, message ?? ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(
            ResponseCode.FORBIDDEN, message ?? ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(
            ResponseCode.UNAUTHORIZED, message ?? ResponseMessage.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(
            ResponseCode.NOT_FOUND, message ?? ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            message ?? ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONFLICT_RESPONSE:
        return Failure(ResponseCode.CONFLICT_RESPONSE,
            message ?? ResponseMessage.FORBIDDEN);
      case DataSource.UNKNOWN:
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      default:
        return Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure api rejected bas request
  static const int FORBIDDEN = 403; // failure api rejected bas request
  static const int UNAUTHORIZED = 401; //failure user is not authorized
  static const int VALIDATION_FAILED = 422;
  static const int NOT_FOUND =
      404; //failure, api url is not content and not found
  static const int CONFLICT_RESPONSE = 409;
  static const int INTERNAL_SERVER_ERROR =
      500; // failure,crash happened in server side

  // local status codes
  static const int UNKNOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = AppConstants.success; // success with data
  static const String NO_CONTENT =
      AppConstants.noContent; // success with no content
  static const String BAD_REQUEST =
      AppConstants.badRequestError; // failure, api rejected our request
  static const String FORBIDDEN =
      AppConstants.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORIZED =
      AppConstants.unauthorizedError; // failure, user is not authorised
  static const String NOT_FOUND = AppConstants
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppConstants.internalServerError; // failure, a crash happened in API side.
  static const String VALIDATION_FAILED =
      AppConstants.validationFailed; // failed to validate
  // local responses codes
  static const String UNKNOWN =
      AppConstants.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppConstants.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppConstants.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppConstants.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppConstants.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppConstants
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppConstants.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
