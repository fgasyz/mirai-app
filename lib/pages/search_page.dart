import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(93),
          child: SafeArea(
              child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                        decoration: const BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(
                                    color: Colors.grey, width: 0.2))),
                        width: constraints.maxWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Get.isDarkMode
                                      ? Colors.grey[850]
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              width: 325,
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                        onPressed: () => Get.back(),
                                        icon: const Icon(
                                          Icons.chevron_left_outlined,
                                          color: Colors.grey,
                                          size: 20,
                                        )),
                                    hintText: 'Search...',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.grey),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15)),
                              ),
                            )
                          ],
                        ),
                      )))),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      5,
                      (index) => GestureDetector(
                          onTap: () => Get.toNamed('/diaries/$index/show'),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 210,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 10),
                                      const Text('2024'),
                                    ],
                                  ),
                                  const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: List.generate(
                                            2,
                                            (index) => Container(
                                                margin: const EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      'https://picsum.photos/150/100'),
                                                ))),
                                      ))
                                ],
                              ))))),
            ));
      }),
    );
  }
}
