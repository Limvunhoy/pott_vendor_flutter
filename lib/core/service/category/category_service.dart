import 'package:dio/dio.dart';
import 'package:pott_vendor/core/model/category/category_response.dart';

class CategoryService {
  Future<List<CategoryResult>?> getCategory() async {
    String url = "https://api.pottbid.com/v1/api/vendor/product/category";

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        var results = response.data["results"] as List;
        final categories = List<CategoryResult>.from(
            results.map((e) => CategoryResult.fromJson(e)));
        return categories;
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }
}
