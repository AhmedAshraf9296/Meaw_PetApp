import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/text_utils.dart';
import 'package:meaw/logic/Controller/order_controller.dart';
import 'package:meaw/routes/routes.dart';

class MyOrdersWidget extends StatelessWidget {
   MyOrdersWidget({Key? key}) : super(key: key);
  final controller = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.getMyOrdersHeader();
        Get.toNamed(Routes.myOrdersScreen);},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          const TextUtils(
              "My Orders", 20, FontWeight.bold, Colors.white, TextDecoration.none)
        ],
      ),
    );
  }
}
