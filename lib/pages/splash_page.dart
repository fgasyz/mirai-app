import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void _navigateToHome() {
    Future.delayed(const Duration(milliseconds: 3000), () => Get.toNamed('/'));
  }

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: Center(child: Text('MIRAI'))));
  }
}
