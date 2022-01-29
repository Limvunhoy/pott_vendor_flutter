import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => buildAndroidLoading();
  // Platform.isAndroid ? buildAndroidLoading() : buildIOSLoading();

  Widget buildAndroidLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(colorExt.PRIMARY_COLOR),
      ),
    );
  }

  Widget buildIOSLoading() {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
