import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class RefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  const RefreshWidget({Key? key, required this.onRefresh, required this.child})
      : super(key: key);
  @override
  _RefreshWidgetState createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) => buildAndroidList();
  // Platform.isIOS ? buildIOSList() : buildAndroidList();

  Widget buildAndroidList() => RefreshIndicator(
        child: widget.child,
        onRefresh: widget.onRefresh,
        color: colorExt.PRIMARY_COLOR,
      );

  Widget buildIOSList() => CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: widget.onRefresh,
          ),
          SliverToBoxAdapter(
            child: widget.child,
          ),
        ],
      );
}
