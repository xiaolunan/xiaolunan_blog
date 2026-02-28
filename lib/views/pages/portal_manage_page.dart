import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 门户管理
 */
class PortalManagementPage extends StatefulWidget {
  const PortalManagementPage({super.key});

  @override
  State<PortalManagementPage> createState() => _PortalManagementPageState();
}

class _PortalManagementPageState extends State<PortalManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('门户管理'));
  }
}
