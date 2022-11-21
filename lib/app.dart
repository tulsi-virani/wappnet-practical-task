import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wappnet_practical_task/UI/categories_screen.dart';

import '../UI/home_screen.dart';
import 'Services/routes.dart';
import 'constants/color_config.dart';

class AppScreen extends StatelessWidget {
  AppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      title: 'Practical Task',
      theme: ThemeData(
        primaryColor: ColorsConfig.blackColor,
        backgroundColor: ColorsConfig.blackColor,
      ),
      debugShowCheckedModeBanner: false,
      getPages: screenpages,
      initialRoute: AppRoute.homeRoute,
    );
  }

  List<GetPage> screenpages = [
    GetPage(
      name: AppRoute.homeRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoute.categories,
      page: () => CategoryScreen(),
    ),
  ];
}
