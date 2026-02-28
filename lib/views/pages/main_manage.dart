import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xiaolunan_blog/views/pages/portal_manage_page.dart';
import 'package:xiaolunan_blog/views/pages/user_manage_page.dart';

import '../sidebar.dart';
import 'admin_manage_page.dart';
import 'home_manage_page.dart';

class MainManage extends StatefulWidget {
  static const String id = "MainManage";

  const MainManage({super.key});

  @override
  State<MainManage> createState() => _MainManageState();
}

class _MainManageState extends State<MainManage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeManagePage(), // 首页
    AdminManagePage(), // 后台管理
    UserManagementPage(), // 用户管理
    PortalManagementPage(), // 门户管理
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo + 标题
                Center(
                  child: Text(
                    'xiaolunan |博客',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color(0xFF3BB3C3),
                      fontFamily: 'STHupo',
                    ),
                  ),
                ),
                // 右侧用户信息
                Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(width: 10),
                    CircleAvatar(child: Text("王")),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              // 左侧导航栏
              Expanded(
                flex: 0,
                child: Sidebar(
                  onPageSelected: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
              // 右侧内容区
              Expanded(child: _pages[_selectedIndex]),
            ],
          ),
        ],
      ),
    );
  }
}
