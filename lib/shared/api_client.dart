import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient({String? baseUrl, String? jwt})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl ??
              const String.fromEnvironment('API_BASE_URL',
                  defaultValue: 'http://localhost:8080'),
          headers: {
            if (jwt != null) 'Authorization': 'Bearer $jwt',
            'Content-Type': 'application/json',
          },
        ));
}
