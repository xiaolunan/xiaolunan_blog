import 'package:dio/dio.dart';

import '../constants.dart';
import '../models/response_result.dart';
import 'network_service.dart';

class UserApi {
  //获取邮箱验证码code
  Future<ResponseResult> fetchVerifyCode(String type, String emailAddress) {
    return httpGet(
      '${Constants.baseUrl}/user/verify_code',
      queryParameters: {'type': type, 'emailAddress': emailAddress},
    );
  }

  //获取图片验证码
  Future<ResponseResult> verificationCode(String captchaKey) {
    return httpGet(
      '${Constants.baseUrl}/user/captcha',
      queryParameters: {'captchaKey': captchaKey},
    );
  }

  //注册账号
  Future<ResponseResult> registerUser({
    required Map<String, dynamic> sobUser,
    required String emailCode,
    required String captcha,
    required String captchaKey,
  }) {
    return httpPost(
      '${Constants.baseUrl}/user/join_in',
      data: sobUser,
      queryParameters: {
        'emailCode': emailCode,
        'captcha': captcha,
        'captchaKey': captchaKey,
      },
    );
  }

  //登录
  Future<ResponseResult> loginUser({
    required Map<String, dynamic> sobUser,
    required String captcha,
    required String captchaKey,
  }) {
    // 将 captcha 和 captchaKey 拼接到 URL 路径中
    final url = '${Constants.baseUrl}/user/log_on/$captcha/$captchaKey';
    return httpPost(url, data: sobUser);
  }

  //获取用户信息
  Future<ResponseResult> getUserInfo({required String? userId}) {
    // 将 captcha 和 captchaKey 拼接到 URL 路径中
    final url = '${Constants.baseUrl}/user/$userId';
    return httpPost(url);
  }

  //修改用户信息
  Future<ResponseResult> updateUserInfo({
    required Map<String, dynamic> sobUser,
    required String userId,
  }) {
    // 将 captcha 和 captchaKey 拼接到 URL 路径中
    final url = '${Constants.baseUrl}/user/$userId';
    return httpPut(url, data: sobUser);
  }

  //忘记密码
  Future<ResponseResult> forgetPassword({
    required Map<String, dynamic> sobUser,
    required String emailCode,
  }) {
    // 将 captcha 和 captchaKey 拼接到 URL 路径中
    final url = '${Constants.baseUrl}/user/forget/password';
    return httpPost(
      url,
      data: sobUser,
      queryParameters: {'emailCode': emailCode},
    );
  }
}
