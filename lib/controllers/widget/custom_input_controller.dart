import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputController extends GetxController {
  final TextEditingController _controller = TextEditingController();

  var value = '';

  get controller => _controller;

  setInput(input) {
    value = input;
  }
}
