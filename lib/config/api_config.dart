import 'package:dio/dio.dart';

/// API 配置类
class ApiConfig {
  /// 基础 URL
  static const String baseUrl = 'http://localhost:8080';

  /// 连接超时时间（毫秒）
  static const int connectTimeout = 30000;

  /// 接收超时时间（毫秒）
  static const int receiveTimeout = 30000;

  /// 创建并配置 Dio 实例
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // 添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('🚀 请求: ${options.method} ${options.path}');
          debugPrint('📤 参数: ${options.queryParameters}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('✅ 响应: ${response.statusCode} ${response.requestOptions.path}');
          debugPrint('📥 数据: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint('❌ 错误: ${error.message}');
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}

void debugPrint(String message) {
  // ignore: avoid_print
  print(message);
}
