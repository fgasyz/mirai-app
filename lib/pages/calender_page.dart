import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mirai_app/components/calender.dart';
import '../layouts/custom_drawer.dart';

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
        return SizedBox(
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              child: Column(children: [
                const Calender(),
                const SizedBox(height: 50),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: List.generate(
                            5,
                            (index) => GestureDetector(
                                key: Key(index.toString()),
                                onTap: () =>
                                    Get.toNamed('/diaries/$index/show'),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    height: 210,
                                    width: constraints.maxWidth,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('20/10',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            const SizedBox(width: 10),
                                            const Text('2024'),
                                          ],
                                        ),
                                        const Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          children: List.generate(
                                              2,
                                              (index) => Container(
                                                  margin: const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                        'https://picsum.photos/125/110'),
                                                  ))),
                                        )
                                      ],
                                    ))))))
              ]),
            ));
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
