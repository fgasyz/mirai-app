import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mirai_app/components/manage_dialog.dart';

class ShowDiaryPage extends StatelessWidget {
  const ShowDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.close), onPressed: () => Get.back()),
          actions: [
            IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => Get.dialog(manageDialog(context: context)))
          ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: constraints.maxWidth,
                              child: SingleChildScrollView(
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
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
                                                                  FontWeight
                                                                      .bold)),
                                                  const SizedBox(width: 10),
                                                  const Text('2024'),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: ImageSlideshow(
                                                      indicatorColor:
                                                          Colors.blue,
                                                      onPageChanged: (value) {
                                                        debugPrint(
                                                            'Page changed: $value');
                                                      },
                                                      autoPlayInterval: 3000,
                                                      isLoop: true,
                                                      children: [
                                                        Image.network(
                                                            'https://picsum.photos/${constraints.maxWidth.toInt()}/250'),
                                                        Image.network(
                                                            'https://picsum.photos/${constraints.maxWidth.toInt()}/250'),
                                                        Image.network(
                                                            'https://picsum.photos/${constraints.maxWidth.toInt()}/250')
                                                      ],
                                                    )),
                                              ),
                                              const SizedBox(height: 20),
                                              const Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )))))
                        ],
                      ),
                    ))));
  }
}
