import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wappnet_practical_task/Services/storage_services.dart';
import 'package:wappnet_practical_task/model/get_categorises_model.dart'
    as category;

import '../../Services/api_services.dart';

class CategoriesController extends GetxController {
  /* @override
  void onInit() {
    getProduct();
    super.onInit();
  }*/

  static RxList<category.Data> categorieslist = <category.Data>[].obs;
  static List<dynamic> jsonArray = [];
  static Future<void> getProduct() async {
    jsonArray = [];
    var response = await http.get(
        Uri.parse(
            'http://veepal.co.in/savitri-mission/category/get_all_category'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["data"];
      for (int i = 0; i < data.length; i++) {
        categorieslist.add(category.Data.fromJson(data[i]));
      }
      StorageServices.saveCategoriesData(categorieslist);
      StorageServices.fetchCategoriesData();
    } else if (response.statusCode == 404) {
      const Text('server not working well Please wait');
    }
  }
}
