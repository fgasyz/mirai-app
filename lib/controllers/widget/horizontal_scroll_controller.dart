import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalScrollController extends GetxController {
  final CustomScrollPhysics scrollPhysics = CustomScrollPhysics();
}

class CustomScrollPhysics extends ScrollPhysics {
  final UniqueKey? diaryKey;
  const CustomScrollPhysics({ScrollPhysics? parent, this.diaryKey})
      : super(parent: parent);
  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: ancestor);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    double result = 0;
    List arrayOfList = List.generate(5, (index) => index);
    arrayOfList.forEach((element) {
      result = offset * element;
    });
    print('diarykey : ' + diaryKey.toString());
    return result;
  }

  @override
  double computeSpringFriction(double overscrollFraction) {
    return 0.1;
  }

  @override
  double get minFlingVelocity => 1.0;
}
