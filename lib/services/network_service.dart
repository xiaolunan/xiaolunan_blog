import 'package:dio/dio.dart';

import '../models/response_result.dart';
import 'authInterceptor.dart';

/// 全局 Dio 实例
final dio = Dio();

/// 初始化网络配置
void initNetwork() {
  // 你可以在这里添加 BaseOptions，例如 baseUrl 或 timeout
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.interceptors.add(AuthInterceptor());
}

/// 通用 GET 请求封装 (改为公开方法以便外部调用)
Future<ResponseResult> httpGet(
  String url, {
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final response = await dio.get(url, queryParameters: queryParameters);
    return _handleResponse(response);
  } on DioException catch (e) {
    return _handleError(e);
  } catch (e) {
    return ResponseResult(isSuccess: false, message: '发生未知错误: $e', code: -2);
  }
}

/// 通用 POST 请求封装 (改为公开方法以便外部调用)
Future<ResponseResult> httpPost(
  String url, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    final response = await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    return _handleResponse(response);
  } on DioException catch (e) {
    return _handleError(e);
  } catch (e) {
    return ResponseResult(isSuccess: false, message: '发生未知错误: $e', code: -2);
  }
}

/// 通用 PUT 请求封装
/// 用于更新现有资源
Future<ResponseResult> httpPut(
  String url, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) async {
  try {
    // 使用 dio.put 发起请求
    final response = await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    // 复用现有的响应处理逻辑
    return _handleResponse(response);
  } on DioException catch (e) {
    // 复用现有的异常处理逻辑
    return _handleError(e);
  } catch (e) {
    return ResponseResult(isSuccess: false, message: '发生未知错误: $e', code: -2);
  }
}

/// 统一处理成功的响应
ResponseResult _handleResponse(Response<dynamic> response) {
  if (response.statusCode == 200) {
    return ResponseResult.fromJson(response.data);
  } else {
    return ResponseResult(
      isSuccess: false,
      message: '请求失败，状态码: ${response.statusCode}',
      code: response.statusCode ?? 500,
    );
  }
}

/// 统一处理 Dio 异常
ResponseResult _handleError(DioException e) {
  String errorMsg = '网络请求失败';
  int errorCode = -1;

  if (e.response != null) {
    try {
      final errorData = e.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ResponseResult.fromJson(errorData);
      }
    } catch (_) {}
    errorMsg = '服务器返回错误: ${e.response?.statusCode}';
    errorCode = e.response?.statusCode ?? -1;
  } else {
    // 处理不同类型的超时和取消
    switch (e.type) {
      case DioExceptionType.receiveTimeout:
        errorMsg = '请求超时';
        break;
      case DioExceptionType.cancel:
        errorMsg = '请求被取消';
        break;
      case DioExceptionType.badCertificate:
        errorMsg = '证书错误';
        break;
      default:
        errorMsg = '未知网络错误';
    }
  }

  return ResponseResult(isSuccess: false, message: errorMsg, code: errorCode);
}
