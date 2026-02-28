import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../services/user_api.dart';

/**
 * 登录
 */
class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  late final TextEditingController _userNameController =
      TextEditingController(); // 先声明但不初始化
  late final TextEditingController _passwordController =
      TextEditingController(); // 先声明但不初始化
  late final TextEditingController _verificationCode = TextEditingController();

  Widget _buildTextFieldContainer(Widget child) {
    return Container(
      width: 250,
      height: 50,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }

  void _showMessage(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.red,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );
  }

  String get captchaImageUrl =>
      '${Constants.baseUrl}/user/captcha?captchaKey=${Constants.captchaKey}&_t=${DateTime.now().millisecondsSinceEpoch}';

  void refreshCaptcha() {
    setState(() {
      // 实际上只需触发 rebuild，因为 URL 中有时间戳
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFFF1F4FD)),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                child: Center(
                  child: Text(
                    'xiaolunan |博客',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xFF3BB3C3),
                      fontFamily: 'STHupo',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17.5),
                ),
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextFieldContainer(
                      TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: '账号或秘密',
                          hintStyle: TextStyle(color: Color(0xFFB2B2B2)),
                          border: InputBorder.none,
                        ),
                      ),
                      //Text('你好'),
                    ),
                    _buildTextFieldContainer(
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '密码',
                          hintStyle: TextStyle(color: Color(0xFFB2B2B2)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    _buildTextFieldContainer(
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '验证码',
                                hintStyle: TextStyle(color: Color(0xFFB2B2B2)),
                                border: InputBorder.none,
                              ),
                              controller: _verificationCode,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              refreshCaptcha();
                            },
                            child: Image.network(
                              captchaImageUrl,
                              height: 50,
                              width: 100,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.grey,
                                  child: Center(child: Text('加载失败')),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 22,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          var userName = _userNameController.text.trim();
                          if (userName.isEmpty) {
                            _showMessage('请输入账号或邮箱！');
                            return;
                          }

                          String password = _passwordController.text.trim();
                          if (password.isEmpty) {
                            _showMessage('请输入密码！');
                            return;
                          }

                          String verificationCode = _verificationCode.text
                              .trim();
                          if (verificationCode.isEmpty) {
                            _showMessage('请输入验证码！');
                            return;
                          }

                          var sobUser = {'userName': userName, 'password': password};
                          var responseResult = await UserApi().loginUser(
                            sobUser: sobUser,
                            captcha: verificationCode,
                            captchaKey: Constants.captchaKey,
                          );
                          if (responseResult.code == Constants.successCode) {
                            // 登录成功的提示
                            _showMessage('登录成功！', backgroundColor: Colors.green);
                            var userId = responseResult.data['id'];
                            SharedPreferences shared =
                                await SharedPreferences.getInstance();
                            shared.setString("userId", userId);

                            // 登录成功后
                            shared.setString(
                              "auth_token",
                              responseResult.data['tokenKey'],
                            );

                            //登录成功跳转页面

                          } else {
                            _showMessage(responseResult.message, backgroundColor: Colors.red);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF0784dc),
                          ),
                        ),
                        child: Text(
                          '登录',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
