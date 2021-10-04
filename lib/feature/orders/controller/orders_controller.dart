import 'package:get/get.dart';

class OrderTabs {
  final String title;

  const OrderTabs(this.title);
}

class OrdersController extends GetxController {
  List<OrderTabs> orderTabs = const <OrderTabs>[
    const OrderTabs("New"),
    const OrderTabs("Ready"),
    const OrderTabs("Finished"),
    const OrderTabs("Complted"),
  ];
}
