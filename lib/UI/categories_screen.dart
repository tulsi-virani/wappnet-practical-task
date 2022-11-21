import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wappnet_practical_task/UI/category_details.dart';
import 'package:wappnet_practical_task/constants/color_config.dart';

import '../Services/storage_services.dart';
import '../controller/categories/categories_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final CategoriesController _category = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConfig.whiteColor,
          elevation: 0,
        ),
        body: Container(
          color: ColorsConfig.whiteColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Categories",
                    style: TextStyle(
                        color: ColorsConfig.blackColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: StorageServices.categoryData.isNotEmpty
                      ? StorageServices.categoryData.length
                      : 0,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Container(
                                  height: 525,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsConfig.lightgreyColor,
                                          blurRadius: 40.0,
                                        ),
                                      ],
                                      color: ColorsConfig.lightgreyColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 515,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsConfig.greyColor,
                                          blurRadius: 40.0,
                                        ),
                                      ],
                                      color: ColorsConfig.greyColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              ),
                              Obx(
                                () => Container(
                                  height: 500,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorsConfig.greyColor,
                                          blurRadius: 40.0,
                                        ),
                                      ],
                                      color: ColorsConfig.whiteColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            height: 400,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(30),
                                                      topLeft:
                                                          Radius.circular(30)),
                                              child: CategoriesController
                                                          .categorieslist[index]
                                                          .catImg ==
                                                      null
                                                  ? Image.asset(
                                                      'assets/noImage.png')
                                                  : Image.network(
                                                      CategoriesController
                                                          .categorieslist[index]
                                                          .catImg!,
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10, left: 5),
                                              decoration: BoxDecoration(
                                                  color: ColorsConfig
                                                      .blackColor,
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  30),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  30))),
                                              child: Text(
                                                StorageServices
                                                        .categoryData[index]
                                                        .catName ??
                                                    'name',
                                                style: TextStyle(
                                                    color:
                                                        ColorsConfig.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 5, right: 5),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: ColorsConfig.greyColor,
                                                  blurRadius: 40.0,
                                                ),
                                              ],
                                              color: ColorsConfig.whiteColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(30),
                                                      bottomLeft:
                                                          Radius.circular(30))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Categories ID:${StorageServices.categoryData[index].catId!}',
                                                style: TextStyle(
                                                    color: ColorsConfig
                                                        .blackColor),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CategoryDetails(
                                                                  index:
                                                                      index)));
                                                },
                                                child: Center(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                        color: ColorsConfig
                                                            .blackColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    30))),
                                                    child: Text(
                                                      'Tap For More',
                                                      style: TextStyle(
                                                          color: ColorsConfig
                                                              .whiteColor),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
