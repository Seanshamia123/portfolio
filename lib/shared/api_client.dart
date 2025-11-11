import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// API Base URL can be set at build time using --dart-define
// Example: flutter build web --dart-define=API_BASE_URL=https://your-backend.onrender.com
const _envBaseUrl = String.fromEnvironment('API_BASE_URL');

class ApiClient {
  final Dio dio;

  ApiClient({String? baseUrl})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? _getBaseUrl(),
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 15),
            headers: const {'Content-Type': 'application/json'},
          ),
        );

  /// Determines the base URL based on environment and platform
  static String _getBaseUrl() {
    // 1. Use provided environment variable (production)
    if (_envBaseUrl.isNotEmpty) {
      return _envBaseUrl;
    }

    // 2. Default to localhost for development
    if (kIsWeb) {
      return 'http://localhost:5000'; // Web/Desktop
    } else {
      return 'http://10.0.2.2:5000'; // Android Emulator
    }
  }

  /// Get the current base URL being used
  String get baseUrl => dio.options.baseUrl;
}
