import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const _envBaseUrl = String.fromEnvironment('API_BASE_URL');

class ApiClient {
  final Dio dio;
  ApiClient({String? baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ??
                (_envBaseUrl.isNotEmpty
                    ? _envBaseUrl
                    : kIsWeb
                        ? 'http://localhost:5000'
                        : 'http://10.0.2.2:5000'),
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 15),
            headers: const {'Content-Type': 'application/json'},
          ),
        );
}
