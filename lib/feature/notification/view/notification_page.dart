import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/notification/view/widget/notification_item.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorExt.PRIMARY_BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text("Notification"),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(appSizeExt.basePadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(appSizeExt.baseBorderRadius),
        ),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 14.0),
          // padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 11.0),
          shrinkWrap: true,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(left: 79), child: Divider()),
          itemBuilder: (context, index) {
            return NotificationItem();
          },
        ),
      ),
    );
  }
}
