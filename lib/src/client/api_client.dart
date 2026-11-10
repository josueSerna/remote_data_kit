import 'package:dio/dio.dart';

import '../errors/api_exception.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 10),
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (error) {
      throw ApiException(
        message: _getErrorMessage(error),
        statusCode: error.response?.statusCode,
      );
    }
  }

  String _getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Se agotó el tiempo de conexión';

      case DioExceptionType.sendTimeout:
        return 'Se agotó el tiempo de envío';

      case DioExceptionType.receiveTimeout:
        return 'Se agotó el tiempo de respuesta';

      case DioExceptionType.connectionError:
        return 'No se pudo conectar con el servidor';

      case DioExceptionType.badResponse:
        return 'El servidor devolvió una respuesta incorrecta';

      default:
        return 'Ocurrió un error durante la solicitud';
    }
  }
}
