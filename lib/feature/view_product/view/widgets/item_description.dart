import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';
import 'package:pott_vendor/utils/helper/cache_image_manager.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({Key? key, required this.controller}) : super(key: key);

  final ViewProductController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: controller.productRecord.images?.length,
        itemBuilder: (context, index) {
          return CacheImageManager.cacheNetworkImage(
            imageUrl: controller.productRecord.images?[index],
            // imageUrl:
            //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqVmFDtPzb1NE0UOaixF8W7gQfqkwc5RFXRw&usqp=CAU",
            width: size.width,
            height: size.width / 2,
          );
        },
      ),
    );
  }
}
