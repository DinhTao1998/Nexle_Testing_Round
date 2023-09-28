import 'package:dio/dio.dart';
import 'client_service_config.dart';
class DioService {
  const DioService._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        // connectTimeout: options?.connectTimeout ?? ClientServiceConfig.connectTimeout,
        // receiveTimeout: options?.receiveTimeout ?? ClientServiceConfig.receiveTimeout,
        // sendTimeout: options?.sendTimeout ?? ClientServiceConfig.sendTimeout,
        baseUrl: options?.baseUrl ?? ClientServiceConfig.getBaseUrl,
      ),
    );
  }
}