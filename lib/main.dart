import 'package:flutter/material.dart';
import 'package:flutter_gallery/ui/main_screen/main_screen.dart';
import 'package:flutter_gallery/ui/main_screen/main_screen_binding.dart';
import 'package:get/get.dart';

import 'app_routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoute.mainScreen,
      initialBinding: MainScreenBinding(),
      getPages: _pages,
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }

  final _pages = [
    GetPage(
        name: AppRoute.mainScreen,
        page: () => const MainScreen(),
        binding: MainScreenBinding())
  ];
}
