import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class ProductOverView extends StatelessWidget {
  const ProductOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultSizeExt.basePadding, vertical: 10.0),
      child: Column(
        children: [
          Text(
            "BES875UK The Barista Express Espresso Samsung Smart TV 8K",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "4.2",
                style: TextStyle(
                  color: colorExt.PRIMARY_COLOR,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                height: 15,
                child: VerticalDivider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Row(
                children: List.generate(
                  5,
                  (index) {
                    return Icon(
                      Icons.star,
                      color: index < 4 ? Color(0xFFF7D92E) : Color(0xFFDDDDDD),
                      size: 17.0,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                height: 15,
                child: VerticalDivider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "5 Reviews",
                style: TextStyle(
                  color: colorExt.LIGHT_GRAY,
                  fontSize: fontSizeExt.mediumSize,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  decorationThickness: 0.5,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Container(
                padding: EdgeInsets.zero,
                height: 15,
                child: VerticalDivider(
                  color: Color(0xFFEEEEEE),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                "Stock 10",
                style: TextStyle(
                  color: colorExt.LIGHT_GRAY,
                  fontSize: fontSizeExt.mediumSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
