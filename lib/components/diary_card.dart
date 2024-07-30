import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget diaryCard(
    {required BuildContext context, required BoxConstraints constraints}) {
  return SizedBox(
      width: constraints.maxWidth,
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(
                5,
                (index) => GestureDetector(
                    onTap: () => Get.toNamed('/diaries/$index/show'),
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.2))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 210,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                            Row(
                              children: List.generate(2, (index) {
                                if (index == 1) {
                                  return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              'https://picsum.photos/125/110',
                                            ),
                                            Container(
                                              height: 110,
                                              width: 125,
                                              color: Get.isDarkMode
                                                  ? Theme.of(context)
                                                      .primaryColorDark
                                                      .withOpacity(0.5)
                                                  : Theme.of(context)
                                                      .primaryColorLight
                                                      .withOpacity(0.5),
                                              child: Center(
                                                  child: Text('+ 2 Lainnya',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium)),
                                            ),
                                          ],
                                        ),
                                      ));
                                }
                                return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          'https://picsum.photos/125/110'),
                                    ));
                              }),
                            )
                          ],
                        ))))),
      ));
}
