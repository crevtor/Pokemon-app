import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  Future onRequest(RequestOptions options, handler) async {
    return super.onRequest(options, handler);
  }
}
