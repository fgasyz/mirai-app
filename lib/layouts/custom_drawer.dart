import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            shape: const RoundedRectangleBorder(),
            child: ListView(
              children: [
                ListTile(
                    title: const Text('Settings'),
                    leading: const Icon(Icons.settings),
                    onTap: () => Get.toNamed('/settings')),
              ],
            )));
  }
}
