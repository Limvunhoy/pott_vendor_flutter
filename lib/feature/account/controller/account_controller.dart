import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountController extends GetxController {
  File? profilePic;
  final ImagePicker _imagePicker = ImagePicker();

  Future pickImage(ImageSource source) async {
    try {
      print("Source $source");
      final image = await _imagePicker.pickImage(source: source);
      print("Image $image");
      if (image == null) return;
      final imageTemp = File(image.path);
      profilePic = imageTemp;
      update();
      print("Profile Path ${profilePic!.path}");
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }
}
