import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.close), onPressed: () => Get.back()),
        ),
        body: SafeArea(
            child: LayoutBuilder(
                builder: (context, constraints) => Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.2))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Settings',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                          const SizedBox(height: 30),
                          Text('Mirai',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Card(
                              elevation: 0.5,
                              child: Column(children: [
                                ListTile(
                                  title: Text('Theme',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  leading: const Icon(Icons.draw_outlined),
                                  trailing: Get.isDarkMode
                                      ? const Icon(Icons.wb_sunny,
                                          color: Colors.amber)
                                      : const Icon(Icons.dark_mode_rounded,
                                          color: Colors.amber),
                                  onTap: () => Get.changeTheme(Get.isDarkMode
                                      ? ThemeData.light()
                                      : ThemeData.dark()),
                                ),
                              ])),
                          const SizedBox(height: 30),
                          Text('About App',
                              style: Theme.of(context).textTheme.bodyMedium),
                          Card(
                              elevation: 0.5,
                              child: Column(children: [
                                ListTile(
                                    title: Text('Privacy and Policy',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    leading: const Icon(Icons.lock_outline)),
                              ])),
                        ],
                      ),
                    ))));
  }
}
