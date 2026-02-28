import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token'); // 你保存的 token key

    if (token != null) {
      // 自动添加 Authorization 头
      options.headers['Authorization'] = 'Bearer $token';
    }

    // 继续请求
    return handler.next(options);
  }
}