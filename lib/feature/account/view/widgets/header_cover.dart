import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/account/controller/account_controller.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class HeaderCover extends StatelessWidget {
  const HeaderCover(
      {Key? key,
      required this.onProfileTap,
      required this.onCameraTap,
      required this.accountController,
      required this.onBack})
      : super(key: key);

  final VoidCallback onProfileTap;
  final VoidCallback onCameraTap;
  final AccountController accountController;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: colorExt.PRIMARY_COLOR,
      expandedHeight: MediaQuery.of(context).size.width / 1.8,
      floating: false,
      pinned: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
      title: Text(
        "Account",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: onCameraTap,
          icon: Image.asset(AssetPath.CAMERA_ICON),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: accountController.coverPic != null
                        ? FileImage(File(accountController.coverPic!.path))
                            as ImageProvider
                        : accountController.authController.auth?.cover != null
                            ? NetworkImage(
                                accountController.authController.auth!.cover!)
                            : NetworkImage(
                                "https://cdn.dribbble.com/users/5536321/screenshots/14189735/dribble_4x.png",
                              ),
                  ),
                ),
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
                    child: ClipOval(
                      child: Material(
                        child: Ink.image(
                          image: accountController.profilePic != null
                              ? FileImage(
                                      File(accountController.profilePic!.path))
                                  as ImageProvider
                              : accountController.authController.auth?.photo !=
                                      null
                                  ? NetworkImage(
                                      accountController
                                          .authController.auth!.photo!,
                                    )
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
