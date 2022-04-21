import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/orders/cart_order_header.dart';
import 'package:meaw/View/widgets/orders/empty_orders.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/logic/Controller/cart_controller.dart';
import 'package:meaw/logic/Controller/order_controller.dart';
import 'package:meaw/logic/Controller/products_controller.dart';

class MyOrdersScreen extends StatelessWidget {
   MyOrdersScreen({Key? key}) : super(key: key);
  final controller = Get.find<OrdersController>();
   final productController = Get.find<ProductsController>();
   final cartController = Get.find<CartController>();
   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: const Text("My Orders"),
          elevation: 0,
          centerTitle: true,
          // backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
          backgroundColor: secondalymainColor,
        ),
        body: Obx(
              (){
                if (controller.ordersHeaderList.isEmpty) {
              return controller.isLoading.value? const Center(child: CircularProgressIndicator()):const EmptyOrders();
            } else {
              return controller.isLoading.value? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 18,top: 15),
                      height: MediaQuery.of(context).size.height *.9,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartOrdersHeader(
                            // productsModel: productController.productList[productController.productList.indexWhere((element) => element.id == controller.ordersDetailList[ind].itemId)],
                            quantity:
                            controller.ordersHeaderList[index].noItems,
                            index: index,
                            myOrderHeaderModel:
                            controller.ordersHeaderList[index],
                            total: controller.ordersHeaderList[index].total,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: controller.ordersHeaderList.length,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}