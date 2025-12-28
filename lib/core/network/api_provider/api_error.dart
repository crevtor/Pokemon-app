import 'dart:io';

import 'package:pokemon/core/resources/export.resources.dart';
import 'package:dio/dio.dart';

class ApiError {
  final int? errorCode;
  final String? errorDescription;
  final dynamic data;
  final DioExceptionType? dioExceptionType;

  static const unknownError = "We are unable to complete this action at the moment. Please try again later";

  ApiError({
    required this.errorCode,
    required this.errorDescription,
    this.data,
    this.dioExceptionType, // Updated property name and type
  });

  factory ApiError.fromDioError(DioException error) {
    // Renamed method and parameter type
    String description = '';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        description = AppConstants.timeoutError;
        break;
      case DioExceptionType.badCertificate:
        description = AppConstants.badRequestError;
        break;
      case DioExceptionType.badResponse:
        description = extractDescriptionFromResponse(error.response);
        break;
      case DioExceptionType.cancel:
        description = unknownError;
        break;
      case DioExceptionType.connectionError:
        description = AppConstants.noInternetError;
        break;
      case DioExceptionType.unknown:
        description = unknownError;
        if (error.error is SocketException || error.error is IOException) {
          description = AppConstants.noInternetError;
        }
        break;
    }

    // Safe data extraction
    dynamic responseData;
    try {
      final rawData = error.response?.data;
      if (rawData is Map) {
        responseData = rawData['data'] ?? rawData;
      } else {
        responseData = rawData;
      }
    } catch (_) {
      responseData = null;
    }

    return ApiError(
      errorCode: error.response?.statusCode,
      errorDescription: description,
      dioExceptionType: error.type,
      data: responseData,
    );
  }

  static String extractDescriptionFromResponse(Response? response) {
    if (response == null) return unknownError;

    try {
      // First, try to extract a useful message from the backend
      final data = response.data;
      if (data != null) {
        // Handle string responses directly
        if (data is String && data.trim().isNotEmpty) {
          return data;
        }

        // Handle Map responses
        if (data is Map) {
          // Handle array of errors
          if (data['errors'] != null) {
            final errors = data['errors'];
            if (errors is List && errors.isNotEmpty) {
              // Handle both string arrays and object arrays
              if (errors.first is Map) {
                return errors.first['message']?.toString() ??
                    errors.first['msg']?.toString() ??
                    errors.first.toString();
              }
              return errors.first.toString();
            } else if (errors is Map && errors.isNotEmpty) {
              // Handle map-based errors (common in validation)
              final firstError = errors.values.first;
              if (firstError is List && firstError.isNotEmpty) {
                return firstError.first.toString();
              }
              return firstError.toString();
            }
          }

          // Handle message field with content checking
          if (data['message'] != null) {
            final message = data['message'].toString();
            if (message.trim().isNotEmpty) return message;
          }
        }
      }

      // Fallback to status-based custom messages
      switch (response.statusCode) {
        case 400: // Bad Request
          return AppConstants.badRequestError;
        // case 401: // Unauthorized
        //   return AppConstants.unauthorizedError;
        case 403: // Forbidden
          return AppConstants.forbiddenError;
        case 404: // Not Found
          return AppConstants.notFoundError;
        case 409: // Conflict
          return AppConstants.conflictError;
        case 422: // Validation Failed (Unprocessable Entity)
          return AppConstants.validationFailed;
        case 500: // Internal Server Error
        case 502: // Bad Gateway
        case 503: // Service Unavailable
          return unknownError;
        default:
          // Handle empty status message safely
          return response.statusMessage?.isNotEmpty == true
              ? response.statusMessage!
              : unknownError;
      }
    } catch (error) {
      return unknownError;
    }
  }

  @override
  String toString() => errorDescription ?? unknownError;
}
