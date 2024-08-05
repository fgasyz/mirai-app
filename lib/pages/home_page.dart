import 'package:flutter/material.dart';
import '../layouts/vertical_diary_card.dart';
import 'package:mirai_app/controllers/widget/vertical_scroll_controller.dart';
import '../layouts/custom_drawer.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  final VerticalScrollController scrollController =
      Get.put(VerticalScrollController());
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
        return VerticalDiaryCard(context: context, constraints: constraints);
      })),
      floatingActionButton: Obx(() => scrollController.isScrolling.value
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.small(
                      shape: const CircleBorder(),
                      heroTag: '1',
                      onPressed: () {
                        Get.toNamed('/calender');
                      },
                      child: const Icon(EvaIcons.calendar_outline)),
                  FloatingActionButton(
                      shape: const CircleBorder(),
                      heroTag: '2',
                      onPressed: () {
                        Get.toNamed('/diaries/add');
                      },
                      child: const Icon(Icons.add))
                ],
              ),
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
