import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 初始化管理员账号
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
      width: 195,
      height: 36,
      padding: EdgeInsets.only(left: 20, right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(18),
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
                      fontSize: 40,
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
                width: 270,
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
                              _showMessage(
                                '验证码已发送！',
                                backgroundColor: Colors.green,
                              );
                            },
                            child: Text(
                              '获取验证码',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF0784dc),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 195,
                      height: 36,
                      child: TextButton(
                        onPressed: () {
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

                          // 登录成功的提示
                          _showMessage('登录成功！', backgroundColor: Colors.green);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF0784dc),
                          ),
                        ),
                        child: Text(
                          '登录',
                          style: TextStyle(
                            fontSize: 14,
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
