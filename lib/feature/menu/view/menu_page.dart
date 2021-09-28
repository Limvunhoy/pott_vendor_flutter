import 'package:flutter/material.dart';
import 'package:pott_vendor/utils/constants/image_path_constant.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/extension/double%20+%20extension.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.PRIMARY_BACKGROUND_COLOR,
        body: Column(
          children: [
            Stack(
              // overflow: Overflow.visible,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 255,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(ImagePathConstant.MENU_BACKGROUND_IMAGE),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(defaultSizeExt.basePadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Vendor",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeExt.heading3,
                              fontWeight: fontWeightExt.baseFontWeight),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "My Apple Gold Store",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeExt.mediumSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -44.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: defaultSizeExt.basePadding),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          defaultSizeExt.baseBorderRadius),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 26.0,
                          height: 25.0,
                          child: Image.asset(
                            ImagePathConstant.WALLET_ICON,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total sales Today",
                                style:
                                    TextStyle(fontSize: fontSizeExt.mediumSize),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "USD",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: fontSizeExt.smallSize),
                                      ),
                                      TextSpan(
                                        text: " \$1.500.00",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: fontSizeExt.largeSize,
                                            fontWeight:
                                                fontWeightExt.baseFontWeight),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Yesterday",
                              style: TextStyle(fontSize: fontSizeExt.smallSize),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "USD",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " \$1.200.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeExt.smallSize,
                                        fontWeight:
                                            fontWeightExt.baseFontWeight),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 44,
            ),
            Container(
              // height: 320,
              padding: const EdgeInsets.all(defaultSizeExt.basePadding),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                        const Color(0xFF4DDCA6),
                        const Color(0xFFFFFFFF),
                      ], radius: 0.55, focal: Alignment.center),
                    ),
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          mainAxisExtent: 160,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                          );
                        })),
              ),
            ),
          ],
        ));
  }
}

// Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 255,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(ImagePathConstant.MENU_BACKGROUND_IMAGE),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Container(
//                 padding: const EdgeInsets.all(paddingExt.basePadding),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome, Vendor",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: fontSizeExt.heading3,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     const SizedBox(
//                       height: 4.0,
//                     ),
//                     Text(
//                       "Welcome, Vendor",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: fontSizeExt.baseFontSize,
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),