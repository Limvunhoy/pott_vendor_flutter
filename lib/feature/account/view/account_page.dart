import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pott_vendor/feature/account/controller/account_controller.dart';
import 'package:pott_vendor/feature/account/view/widgets/account_body.dart';
import 'package:pott_vendor/feature/account/view/widgets/header_cover.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';

class AccountPage extends StatelessWidget {
  // const AccountPage({Key? key}) : super(key: key);

  final AccountController _controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardContent(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HeaderCover(
              onProfileTap: () async {
                print("Handle On Profile Tapped");
                final source = await showImageSource(context);
                if (source != null) {
                  print("Image Source $source");
                  _controller.pickImage(source);
                }
              },
              accountController: _controller,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 30.0),
              sliver: SliverToBoxAdapter(
                child: AccountBody(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultSizeExt.basePadding,
                vertical: defaultSizeExt.basePadding),
            child: BaseButton(
              onPressed: () {},
              title: "Update",
              titleColor: Colors.white,
              backgroundColor: colorExt.PRIMARY_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}

// Handle Functions
extension on AccountPage {
  Future<ImageSource?> showImageSource(BuildContext context) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back(result: ImageSource.camera);
              },
              child: Text("Take Photo"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Get.back(result: ImageSource.gallery);
              },
              child: Text("Choose From Library"),
            ),
          ],
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Take Photo"),
              onTap: () {
                Get.back(result: ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              onTap: () {
                Get.back(result: ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    }
  }
}
