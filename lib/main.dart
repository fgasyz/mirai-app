import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mirai_app/pages/add_diary_page.dart';
import 'package:mirai_app/pages/calender_page.dart';
import 'package:mirai_app/pages/home_page.dart';
import 'package:mirai_app/pages/search_page.dart';
import 'package:mirai_app/pages/setting_page.dart';
import 'package:mirai_app/pages/show_diary_page.dart';
import 'package:mirai_app/pages/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    return;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashPage()),
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/search', page: () => const SearchPage()),
        GetPage(name: '/calender', page: () => CalenderPage()),
        GetPage(name: '/settings', page: () => const SettingPage()),
        GetPage(name: '/diaries/add', page: () => const AddDiaryPage()),
        GetPage(name: '/diaries/:id/show', page: () => const ShowDiaryPage()),
      ],
    );
  }
}
