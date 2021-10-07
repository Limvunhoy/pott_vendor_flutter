import 'package:flutter/material.dart';
import 'package:pott_vendor/feature/processing/view/widgets/export_widgets.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
                fontSize: fontSizeExt.mediumSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "- ABS: Single Channel \n"
            "- Engine: 199.5 cc \n"
            "- Power: 24.6 PS @ 9750 rpm",
            style:
                TextStyle(color: Colors.black, fontSize: fontSizeExt.smallSize),
          ),
        ],
      ),
    );
  }
}
