import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/cart/cart_total.dart';
import 'package:meaw/View/widgets/cart/empty_cart.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/logic/Controller/cart_controller.dart';

import '../widgets/cart/cart_product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          centerTitle: true,
          // backgroundColor: Get.isDarkMode ? Colors.black : mainColor,
          backgroundColor:secondalymainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProductsInCart();
              },
              icon: const Icon(
                Icons.backspace,
              ),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      // decoration: BoxDecoration(
                      //   color: Colors.grey.shade900
                      // ),
                      height: MediaQuery.of(context).size.height*0.72,
                      // height: 600,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProduct(
                            quantity:
                                controller.productsMap.values.toList()[index],
                            index: index,
                            productsModel:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
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
