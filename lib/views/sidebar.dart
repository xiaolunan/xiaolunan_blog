import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? 60 : 240,
      color: Colors.white,
      child: Column(
        children: [
          // 折叠按钮（可选）
          IconButton(
            icon: Icon(isCollapsed ? Icons.menu : Icons.close),
            onPressed: () => setState(() => isCollapsed = !isCollapsed),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("首页"),
                  onTap: () => {

                  },
                ),
                ExpansionTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("订单管理"),
                  children: [
                    ListTile(title: Text("后台管理")),
                    ListTile(title: Text("用户管理")),
                    ListTile(title: Text("门户管理")),
                  ],
                ),
                // 其他菜单...
              ],
            ),
          ),
        ],
      ),
    );
  }
}