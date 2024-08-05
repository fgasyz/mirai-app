import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mirai_app/components/calender.dart';
import 'package:mirai_app/controllers/widget/vertical_scroll_controller.dart';
import '../layouts/custom_drawer.dart';
import '../layouts/horizontal_diary_card.dart';

class CalenderPage extends StatelessWidget {
  CalenderPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              _drawerKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu)),
        title: Text('MIRAI', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              icon: const Icon(EvaIcons.search))
        ],
      ),
      body: SafeArea(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.2))),
          width: constraints.maxWidth,
          child: Column(children: [
            const Calender(),
            const SizedBox(height: 30),
            HorizontalDiaryCard(
                context: context, constraints: constraints, height: 210)
          ]),
        );
      })),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.small(
                shape: const CircleBorder(),
                heroTag: '1',
                onPressed: () {
                  Get.delete<VerticalScrollController>();
                  Get.toNamed('/');
                },
                child: const Icon(EvaIcons.grid_outline)),
            FloatingActionButton(
                shape: const CircleBorder(),
                heroTag: '2',
                onPressed: () {
                  Get.toNamed('/diaries/add');
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
