import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices {
  static final _box = GetStorage();

  static String categoriesData = 'categoriesData';

  static saveCategoriesData(List categoriesDatas) {
    _box.write(categoriesData, categoriesDatas);
  }

  static RxList categoryData = [].obs;
  static List fetchCategoriesData() {
    if (_box.read(categoriesData) != null) {
      categoryData = _box.read(categoriesData);
    }
    return categoryData;
  }
}
