import 'package:get/get.dart';
import 'package:pott_vendor/core/model/product/product_response.dart';

class ViewProductController extends GetxController {
  String getNumberAddZero(int number) {
    if (number < 10) {
      return "0" + number.toString();
    }
    return number.toString();
  }

  int _scrollIndex = 1;

  int get getScrollIndex {
    return _scrollIndex;
  }

  void setScrollIndex(int index) {
    _scrollIndex = index + 1;
    update();
  }

  List<String> dummyProductItems = [
    "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/155656488/original/0c6ecaeeab2e9b46e3af35c66be9ad2e081929be/design-awesome-website-banner-or-product-banner.jpg",
    "https://i.ytimg.com/vi/dVuyfNVcwO4/maxresdefault.jpg",
    "https://1.bp.blogspot.com/-9gc8riuC1pE/YPwuVApgG4I/AAAAAAAAVuU/Ke3rU9EorFstBRno2nWW5iNhkKCBFcaBwCLcBGAsYHQ/s900/Shoes%2B%2BWeb%2BBanners.jpg",
  ];

  final args = Get.arguments;
  late ProductRecord productRecord;
  bool isBid = false;

  @override
  void onInit() {
    isBid = args["isBid"];
    productRecord = args["productRecord"];
    update();
    // if (args["isBid"] == true) {
    //   isBid = args["isBid"];
    //   update();
    // }
    //
    //
    //
    // if (args["productRecord"] is ProductRecord) {
    //   productRecord = args;
    //   update();
    // }

    super.onInit();
  }
}
