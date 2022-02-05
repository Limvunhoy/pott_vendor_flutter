import 'package:get/get.dart';
import 'package:pott_vendor/core/model/category/category_response.dart';
import 'package:pott_vendor/core/service/category/category_service.dart';
import 'package:pott_vendor/utils/helper/fetch_status.dart';

class CategoryController extends GetxController {
  bool isExpanded = false;

  handleExpanded(bool isOpen) {
    isExpanded = isOpen;
    update();
  }

  List<CategoryResult>? categories;
  final CategoryService _service = CategoryService();
  FetchStatus fetchStatus = FetchStatus.idle;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  getCategory() async {
    try {
      fetchStatus = FetchStatus.loading;
      final res = await _service.getCategory();
      if (res != null) {
        categories = res;
      } else {
        categories = [];
      }
      fetchStatus = FetchStatus.complete;
      update();
    } catch (e) {
      print("Failed to Get Category: $e");
      fetchStatus = FetchStatus.error;
      update();
    }
  }

  int getCategoryCount() {
    return categories!.length;
  }

  int getSubCategoryCount(int index) {
    return categories?[index].children.length ?? 0;
  }

  String categoryParentNameFormat(int index) {
    return categories?[index].data.nameEn ?? "N/A";
  }
}
