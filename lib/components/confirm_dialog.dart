import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future confirmDialog() {
  return Get.defaultDialog(
    titleStyle: const TextStyle(fontSize: 0),
    middleText: 'Are you sure you want to delete diary?',
    radius: 10,
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel')),
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Delete'))
    ],
  );
}
