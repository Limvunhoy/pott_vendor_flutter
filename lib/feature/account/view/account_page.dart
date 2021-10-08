import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/account/view/widgets/account_body.dart';
import 'package:pott_vendor/feature/account/view/widgets/header_cover.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';
import 'package:pott_vendor/utils/common/dissmiss_keyboard_content.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardContent(
      child: Scaffold(
        backgroundColor: colorExt.PRIMARY_BACKGROUND_COLOR,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HeaderCover(),
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
                horizontal: defaultSizeExt.basePadding),
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
