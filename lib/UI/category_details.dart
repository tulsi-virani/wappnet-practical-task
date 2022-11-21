import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wappnet_practical_task/constants/color_config.dart';

import '../controller/categories/categories_controller.dart';

class CategoryDetails extends StatelessWidget {
  int index;
  final CategoriesController _category = Get.put(CategoriesController());

  CategoryDetails({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  floating: true,
                  snap: false,
                  expandedHeight: 500,
                  elevation: 0,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  foregroundColor: ColorsConfig.blackColor,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          child: SizedBox(
                            height: 400,
                            child: CategoriesController
                                        .categorieslist[index].catImg ==
                                    null
                                ? Image.asset('assets/noImage.png')
                                : Image.network(
                                    CategoriesController
                                        .categorieslist[index].catImg!,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories name:-${CategoriesController.categorieslist[index].catName}' ??
                            '',
                        style: TextStyle(
                            color: ColorsConfig.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      size(),
                      Text(
                        'Categories modify Date:- ${CategoriesController.categorieslist[index].modifiedAt ?? ' '}',
                        style: TextStyle(
                            color: ColorsConfig.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                      size(),
                      Text(
                        'Categories create Date:-${CategoriesController.categorieslist[index].createdAt ?? ' '}',
                        style: TextStyle(
                            color: ColorsConfig.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      size(),
                      Text(
                        'Categories Id:-${CategoriesController.categorieslist[index].catId ?? ' '}',
                        style: TextStyle(
                            color: ColorsConfig.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ]),
              ),
            )));
  }

  Widget size() {
    return const SizedBox(
      height: 20,
    );
  }
}
