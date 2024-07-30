import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDiaryPage extends StatelessWidget {
  const AddDiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
      ),
      body: SafeArea(
          child: LayoutBuilder(
              builder: (context, constraints) => Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('20/10',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          const Text('2024'),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.8,
                        child: TextField(
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                              hintText: 'How was your day today?',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15)),
                        ),
                      ),
                    ]),
                  ))),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.small(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: const CircleBorder(),
                heroTag: '1',
                onPressed: () {
                  Get.defaultDialog(radius: 10);
                },
                child: const Icon(Icons.image_outlined)),
            SizedBox(
                width: 80,
                child: FloatingActionButton.small(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    heroTag: '2',
                    onPressed: () {
                      Get.toNamed('/diaries/add');
                    },
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Save'))))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
