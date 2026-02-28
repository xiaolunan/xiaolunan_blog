import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 后台管理
 */
class AdminManagePage extends StatefulWidget {
  const AdminManagePage({super.key});

  @override
  State<AdminManagePage> createState() => _AdminManagePageState();
}

class _AdminManagePageState extends State<AdminManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('后台管理'),);
  }
}
