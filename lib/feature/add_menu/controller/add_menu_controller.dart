import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  ProductService _service = ProductService();

  final ImagePicker _imagePicker = ImagePicker();

  final int limitPhoto = 10;

  // List<XFile>? selectedImages;
  String? selectedCategory;

  counterText(String text) {
    enteredText.value = text;
  }

  updateSelectedCategory(String cate) {
    selectedCategory = cate;
    update();
  }

  List<File> descriptionPhotos = [];
  List<File> photos = [];

  // UploadImageResponse? uploadPhotoResponse

  // Future pickImage() async {
  //   try {
  //     final image = await _imagePicker.pickMultiImage();
  //     if (image == null) return;
  //     selectedImages = image;
  //     update();
  //     print("Selected Images ${selectedImages!.length}");
  //   } on PlatformException catch (e) {
  //     print("Error Pick Image $e");
  //   }
  // }

  photoPicker() async {
    try {
      final _selectedImages = await _imagePicker.pickMultiImage(
          maxWidth: 2048.0, maxHeight: 2048.0);
      if (_selectedImages!.isNotEmpty) {
        _selectedImages.forEach((element) {
          photos.add(File(element.path));
        });
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  photoCameraPicker() async {
    try {
      final _pic = await _imagePicker.pickImage(source: ImageSource.camera);
      if (_pic != null) {
        photos.add(File(_pic.path));
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  descriptionPhotoPicker() async {
    try {
      final _selectedImages = await _imagePicker.pickMultiImage(
          maxWidth: 2048.0, maxHeight: 2048.0);
      if (_selectedImages!.isNotEmpty) {
        _selectedImages.forEach((element) {
          descriptionPhotos.add(File(element.path));
        });
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  photoDescriptionCameraPicker() async {
    try {
      final _pic = await _imagePicker.pickImage(source: ImageSource.camera);
      if (_pic != null) {
        descriptionPhotos.add(File(_pic.path));
        update();
      } else {
        print("No Photo Selected");
      }
    } on PlatformException catch (e) {
      print("Error Pick Image $e");
    }
  }

  handleRemovePhoto(int index) {
    photos.removeAt(index);
    update();
  }

  handleRemoveDescriptionPhoto(int index) {
    descriptionPhotos.removeAt(index);
    update();
  }

  uploadProductPhotos() async {
    try {
      photos.forEach((element) async {
        final res = await _service.uploadImage(element);
        if (res != null) {
          print("Product Upload Photo: ${res.results.path}");
        }
      });
    } catch (e) {
      print("Failed to Upload Product Photo $e");
    }
  }
}
