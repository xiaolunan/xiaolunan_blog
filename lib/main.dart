import 'package:flutter/material.dart';
import 'package:xiaolunan_blog/views/pages/home_manage_page.dart';
import 'package:xiaolunan_blog/views/pages/main_manage.dart';

import 'views/pages/login_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: MainManage.id,
      routes: {
        LoginAccount.id: (context) => const LoginAccount(),
        MainManage.id: (context) => const MainManage(),
      },
    );
  }
}
