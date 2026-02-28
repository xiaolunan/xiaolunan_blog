class Constants {
  //家里电脑：192.168.0.138
  //公司电脑：192.168.2.13
  static const String baseUrl = 'http://192.168.2.45:8080';
  static const String captchaKey = '65463546453546754';
  static const int successCode = 20000; //操作成功
  static const int failureCode = 40000; //操作失败
  static const int notLoggedInCode = 40002; //账号未登录

  //imgbb签名
  static const String imgbbKey = '4c0a4640d691ad1a1d91a7b7f407688e';
  static const String imgbbUrl = 'https://api.imgbb.com';
}
