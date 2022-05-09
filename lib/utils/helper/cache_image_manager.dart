import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class CacheImageManager {
  static cacheNetworkImage({
    required imageUrl,
    double? width,
    double? height,
    Widget Function(BuildContext, String, dynamic)? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: errorWidget,
      placeholder: (context, _) {
        // return Icon(Icons.image_outlined);
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: colorExt.PRIMARY_BACKGROUND_COLOR,
            borderRadius: BorderRadius.circular(6.0),
          ),
        );
      },
    );
  }
}
