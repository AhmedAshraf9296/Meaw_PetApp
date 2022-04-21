import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/Model/my_order_detail_model.dart';
import 'package:meaw/Model/products_model.dart';
import 'package:meaw/View/screens/product_details_screen.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/logic/Controller/order_controller.dart';

class CartOrdersDetail extends StatelessWidget {
  final ProductsModel productsModel;
  final MyOrderDetailModel myOrderDetailModel;
  final int index;
  final int quantity;
  final double total;
  final double price;
  final controller = Get.find<OrdersController>();

  CartOrdersDetail(
      {Key? key,
      required this.productsModel,
      required this.myOrderDetailModel,
      required this.index,
      required this.quantity,
      required this.total,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 160,
      width: 100,
      decoration: BoxDecoration(
          // color: Get.isDarkMode
          //     ? greenColor.withOpacity(0.4)
          //     : mainColor.withOpacity(0.7),
          color: mainColor,
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsScreen(
            productsModel: productsModel,
          ));
          // controller.getMyOrdersDetail(myOrderHeaderModel.id.toInt());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 100,
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      // "https://www.iwmbuzz.com/wp-content/uploads/2021/07/what-is-so-special-about-alexandra-daddarios-eyes-deets-inside-see-asap.jpg",
                      productsModel.imgUrl!,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    controller.ordersDetailList[index].ItemName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Quantity : $quantity",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Price : $price",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Total : $total",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
