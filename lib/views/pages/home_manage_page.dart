import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeManagePage extends StatefulWidget {
  const HomeManagePage({super.key});

  @override
  State<HomeManagePage> createState() => _HomeManagePageState();
}

class _HomeManagePageState extends State<HomeManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('首页'),);
  }
}
