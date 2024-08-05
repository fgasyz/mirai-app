import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/controllers/widget/vertical_scroll_controller.dart';
import '../data/fakedata.dart';

class VerticalDiaryCard extends StatelessWidget {
  final BoxConstraints constraints;
  final BuildContext context;
  final double? height;
  VerticalDiaryCard(
      {Key? key, required this.constraints, required this.context, this.height})
      : super(key: key);
  final VerticalScrollController scrollController =
      Get.find<VerticalScrollController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? constraints.maxHeight,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: fakedata.length,
            controller: scrollController.controller,
            itemBuilder: (context, index) => Center(
                  child: GestureDetector(
                      onTap: () => Get.toNamed('/diaries/$index/show'),
                      child: Container(
                          height: 210,
                          width: constraints.maxWidth,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.2))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                              Text(
                                fakedata[index].title,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            fakedata[index].image),
                                      ));
                                }),
                              )
                            ],
                          ))),
                )));
  }
}
