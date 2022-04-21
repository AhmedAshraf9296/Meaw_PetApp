import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/orders/cart_order_detail.dart';
import 'package:meaw/View/widgets/orders/empty_orders.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/logic/Controller/order_controller.dart';
import 'package:meaw/logic/Controller/products_controller.dart';

class MyOrdersDetailsScreen extends StatelessWidget {
  MyOrdersDetailsScreen({Key? key}) : super(key: key);
  final controller = Get.find<OrdersController>();
  final productController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Order Details"),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.black : secondalymainColor,
        ),
        body: Obx(
          () {
            if (controller.ordersDetailList.isEmpty) {
              return controller.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
                  : const EmptyOrders();
            } else {
              return controller.isLoading.value
                  ? const Center(
                    child: CircularProgressIndicator(
                color: mainColor,
              ),
                  )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 17),
                      height: MediaQuery.of(context).size.height * .9,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return  CartOrdersDetail(
                                  productsModel: productController.productList[
                                      productController.productList.indexWhere(
                                          (element) =>
                                              element.id ==
                                              controller.ordersDetailList[index]
                                                  .itemId)],
                                  quantity:
                                      controller.ordersDetailList[index].qty,
                                  index: index,
                                  myOrderDetailModel:
                                      controller.ordersDetailList[index],
                                  total:
                                      controller.ordersDetailList[index].total,
                                  price:
                                      controller.ordersDetailList[index].price,
                                );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                        itemCount: controller.ordersDetailList.length,
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
