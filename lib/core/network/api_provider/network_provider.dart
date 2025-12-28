import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/services/export.services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'export_api_provider.dart';

class NetworkProvider {
  static const int connectTimeOut = 30000;
  static const int receiveTimeOut = 30000;
  static final String baseApiUrl = EnvironmentConfig.baseUrl;
  static final String apiVersion = 'api/v2/';
  final Dio _dio;

  NetworkProvider({Dio? dio}) : _dio = dio ?? Dio(_defaultOpts) {
    if (dio == null) {
      // Only configure if Dio wasn't passed in (i.e., use default settings)
      if (kDebugMode) {
        _dio.interceptors.add(
          PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true),
        );
      }
    }
  }

  Dio get dio => _dio;

  factory NetworkProvider.fromBaseUrl(String? baseUrl, Ref ref) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl ?? baseApiUrl+apiVersion,
      connectTimeout: const Duration(milliseconds: connectTimeOut),
      receiveTimeout: const Duration(milliseconds: receiveTimeOut),
    ));

    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true),
      AppInterceptor(),
    ]);

    return NetworkProvider(dio: dio);
  }

  factory NetworkProvider.forBaseCalls(Ref ref) => NetworkProvider.fromBaseUrl(
      baseApiUrl+apiVersion, ref);

  static BaseOptions get _defaultOpts {
    return BaseOptions(
      baseUrl: baseApiUrl+apiVersion,
      connectTimeout: const Duration(milliseconds: connectTimeOut),
      receiveTimeout: const Duration(milliseconds: receiveTimeOut),
    );
  }
}

final networkProvider = Provider<NetworkProvider>((ref) {
  return NetworkProvider.forBaseCalls(ref);
});
