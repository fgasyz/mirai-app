import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalScrollController extends GetxController {
  late ScrollController controller;
  var isScrolling = false.obs;

  void handlePositionChange() {
    if (isScrolling.value != controller.position.isScrollingNotifier.value) {
      isScrolling.value = controller.position.isScrollingNotifier.value;
    }
  }

  void _handlePositionAttach(ScrollPosition position) {
    position.isScrollingNotifier.addListener(handlePositionChange);
  }

  void _handlePositionDetach(ScrollPosition position) {
    position.isScrollingNotifier.removeListener(handlePositionChange);
  }

  @override
  void onInit() {
    super.onInit();
    controller = ScrollController(
      onAttach: _handlePositionAttach,
      onDetach: _handlePositionDetach,
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
