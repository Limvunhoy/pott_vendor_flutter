import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HStackProductImageList extends StatelessWidget {
  const HStackProductImageList({Key? key, required this.controller})
      : super(key: key);

  final ViewProductController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.width / 1.2,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Image.asset(
          AssetPath.BACK_ICON,
          fit: BoxFit.cover,
          width: 31.0,
          height: 31.0,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AssetPath.MORE_ICON,
            fit: BoxFit.cover,
            width: 31.0,
            height: 31.0,
          ),
        ),
      ],
      floating: true,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
          stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
          background: Container(
            child: Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(parent: ClampingScrollPhysics()),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return VisibilityDetector(
                      key: Key(
                        index.toString(),
                      ),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction == 1) {
                          controller.setScrollIndex(index);
                        }
                      },
                      child: Image.network(
                        // "https://i.ytimg.com/vi/ISVCtciJ7yM/maxresdefault.jpg",
                        "${controller.productRecord.image}",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 9.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "${controller.getScrollIndex}/1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeExt.extraSmallSize,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
