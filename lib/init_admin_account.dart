import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 初始化管理员账号
 */
class InitAdminAccount extends StatefulWidget {
  const InitAdminAccount({super.key});

  @override
  State<InitAdminAccount> createState() => _InitAdminAccountState();
}

class _InitAdminAccountState extends State<InitAdminAccount> {
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
                child: Center(
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
                        Container(
                          width: 195,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7D7D7),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '用户名',
                              hintStyle: TextStyle(color: Color(0xFFB2B2B2)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          width: 195,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Color(0xFFD7D7D7),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '密 码',
                              hintStyle: TextStyle(color: Color(0xFFB2B2B2)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
