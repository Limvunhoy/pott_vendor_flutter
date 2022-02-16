import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/core/model/category/category_response.dart';
import 'package:pott_vendor/core/model/product/add_product_body_request.dart';
import 'package:pott_vendor/core/service/product/product_service.dart';

class AddMenuController extends GetxController {
  RxString enteredText = "".obs;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  ProductService _service = ProductService();

  final ImagePicker _imagePicker = ImagePicker();

  final int limitPhoto = 10;

  late AddProductBodyRequest addProductBodyRequest;

  // List<XFile>? selectedImages;
  CategoryResult? selectedCategory;

  counterText(String text) {
    enteredText.value = text;
  }

  updateSelectedCategory(CategoryResult cate) {
    selectedCategory = cate;
    update();
  }

  List<File> descriptionPhotos = [];
  List<File> photos = [];

  photoPicker() async {
    try {
      final _selectedImages = await _imagePicker.pickMultiImage(
          maxWidth: 1920.0, maxHeight: 1080.0);
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
          maxWidth: 1920.0, maxHeight: 1080.0);
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

  AddProductBodyRequest handleContinue() {
    addProductBodyRequest = AddProductBodyRequest(
      name: titleTextController.text,
      thumnail: "",
      images: [],
      description: descriptionTextController.text,
      categoryId: selectedCategory?.data.id ?? "",
      vendorId: -1,
      productOptions: [],
      productVariance: [],
    );

    return addProductBodyRequest;
  }
}
