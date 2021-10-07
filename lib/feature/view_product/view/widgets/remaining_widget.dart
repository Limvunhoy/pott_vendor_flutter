import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/feature/view_product/controller/view_product_controller.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class RemainingWidget extends StatelessWidget {
  const RemainingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 100000 * 30;
    final _controller = Get.find<ViewProductController>();

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 18.0,
          color: Color(0xFF31BC88),
          child: Text(
            "Buy it now \$ 1369.00",
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeExt.extraSmallSize,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 55.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF15877F),
                const Color(0xFF47B791),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "\$1000.00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Current Bid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeExt.extraSmallSize,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 13.5),
                child: VerticalDivider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Container(
                        child: CountdownTimer(
                          endTime: endTime,
                          widgetBuilder: (context, currentTime) {
                            return Container(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 25.0,
                                    height: 17.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0),
                                      ),
                                    ),
                                    child: Text(
                                        "${_controller.getNumberAddZero(currentTime!.hours ?? 0)}"),
                                  ),
                                  Text(
                                    " : ",
                                    style: TextStyle(
                                        fontSize: fontSizeExt.smallSize,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 17.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0),
                                      ),
                                    ),
                                    child: Text(
                                        "${_controller.getNumberAddZero(currentTime.min ?? 0)}"),
                                  ),
                                  Text(
                                    " : ",
                                    style: TextStyle(
                                        fontSize: fontSizeExt.smallSize,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 17.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.0),
                                        bottomLeft: Radius.circular(6.0),
                                      ),
                                    ),
                                    child: Text(
                                        "${_controller.getNumberAddZero(currentTime.sec ?? 0)}"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Time remaining",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeExt.extraSmallSize,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
