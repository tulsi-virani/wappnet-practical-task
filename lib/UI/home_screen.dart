import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wappnet_practical_task/Services/routes.dart';
import 'package:wappnet_practical_task/controller/Auth/google_sign_in.dart';
import 'package:wappnet_practical_task/controller/categories/categories_controller.dart';

import '../constants/color_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.whiteColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    AuthController.signInWithGoogle(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: ColorsConfig.blackColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Google Sign In',
                          style: TextStyle(color: ColorsConfig.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    CategoriesController.getProduct()
                        .then((value) => Get.toNamed(AppRoute.categories));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: ColorsConfig.blackColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      children: [
                        Text(
                          'Categories',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorsConfig.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
