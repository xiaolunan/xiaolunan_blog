import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 用户管理
 */
class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child:  Text('用户管理'),);
  }
}
