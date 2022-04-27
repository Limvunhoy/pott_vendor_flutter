import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheImageManager {
  static cacheNetworkImage({
    required imageUrl,
    double? width,
    double? height,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Icon(Icons.image_outlined);
      },
    );
  }
}
