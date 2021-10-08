import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/account/controller/account_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class HeaderCover extends StatelessWidget {
  const HeaderCover(
      {Key? key, required this.onProfileTap, required this.accountController})
      : super(key: key);

  final VoidCallback onProfileTap;
  final AccountController accountController;

  @override
  Widget build(BuildContext context) {
    // final imagePath = this.accountController.profilePic!.path;
    // final image = imagePath.contains("https://")
    //     ? NetworkImage(
    //         "https://graphicsfamily.com/wp-content/uploads/edd/2021/02/Cool-Gadgets-Facebook-Cover-Template-Design-scaled.jpg",
    //       )
    //     : FileImage(File(imagePath));

    return SliverAppBar(
      backgroundColor: colorExt.PRIMARY_COLOR,
      expandedHeight: MediaQuery.of(context).size.width / 1.8,
      floating: false,
      pinned: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
      title: Text(
        "Account",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(ImagePathConstant.CAMERA_ICON),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          color: colorExt.PRIMARY_BACKGROUND_COLOR,
          child: Stack(
            children: [
              Image.network(
                "https://cdn.dribbble.com/users/5536321/screenshots/14189735/dribble_4x.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: GetBuilder(
                      init: AccountController(),
                      builder: (context) {
                        return ClipOval(
                          child: Material(
                            child: Ink.image(
                              // image: image as ImageProvider,
                              image: accountController.profilePic != null
                                  ? FileImage(File(
                                          accountController.profilePic!.path))
                                      as ImageProvider
                                  : NetworkImage(
                                      "https://graphicsfamily.com/wp-content/uploads/edd/2021/02/Cool-Gadgets-Facebook-Cover-Template-Design-scaled.jpg",
                                    ),
                              fit: BoxFit.cover,
                              width: 116.0,
                              height: 116.0,
                              child: InkWell(
                                onTap: onProfileTap,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
