import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
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
        margin: const EdgeInsets.all(defaultSizeExt.basePadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultSizeExt.baseBorderRadius),
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

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.zero,
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF8F89D6).withOpacity(0.3),
              blurRadius: 6,
              offset: Offset(0, 6),
            ),
          ],
          image: DecorationImage(
              image: AssetImage(ImagePathConstant.PRODUCT_READY),
              fit: BoxFit.cover),
        ),
      ),
      title: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Your Product Send ready to Delivery ",
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            TextSpan(
              text: "#123455",
              style: TextStyle(
                color: colorExt.PRIMARY_COLOR,
                fontSize: 15.0,
              ),
            ),
            TextSpan(
              text: " as Pick up.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Yesterday",
            style: TextStyle(color: Colors.grey, fontSize: 15.0),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Container(
            width: 9.0,
            height: 9.0,
            decoration: BoxDecoration(
              color: Color(0xFFFF6969),
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
