import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  final ImagePicker _imagePicker = ImagePicker();

  List<XFile>? selectedImages = [];
  String? selectedCategory;

  counterText(String text) {
    enteredText.value = text;
  }

  updateSelectedCategory(String cate) {
    selectedCategory = cate;
    update();
  }

  Future pickImage() async {
    try {
      final image = await _imagePicker.pickMultiImage();
      if (image == null) return;
      selectedImages = image;
      update();
      print("Selected Images ${selectedImages!.length}");
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }
}
