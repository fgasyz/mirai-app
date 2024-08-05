import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirai_app/controllers/widget/custom_input_controller.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  CustomInputController inputController = Get.put(CustomInputController());

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
                                controller: inputController.controller,
                                onChanged: inputController.setInput,
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
      // body: LayoutBuilder(
      //     builder: (BuildContext context, BoxConstraints constraints) {
      //   return VerticalDiaryCard(context: context, constraints: constraints);
      // }),
    );
  }
}
