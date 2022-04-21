import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/Model/my_order_header_model.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/logic/Controller/order_controller.dart';
import 'package:meaw/routes/routes.dart';

class CartOrdersHeader extends StatelessWidget {
  // final ProductsModel productsModel;
  final MyOrderHeaderModel myOrderHeaderModel;
  final int index;
  final int quantity;
  final double total;
  final controller = Get.find<OrdersController>();
  CartOrdersHeader({
    Key? key,
    // required this.productsModel,
    required this.myOrderHeaderModel,
    required this.index,
    required this.quantity,
    required this.total
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          // color: Get.isDarkMode
          //     ? greenColor.withOpacity(0.4)
          //     : mainColor.withOpacity(0.7),
          color: mainColor,
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: (){
          controller.getMyOrdersDetail(myOrderHeaderModel.id);
          Get.toNamed(Routes.myOrdersDetailsScreen);
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
                image:  const DecorationImage(
                    image: NetworkImage(
                      "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/38/5812/1.jpg"
                      // productsModel.imgUrl!,
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
                children:  [
                  const SizedBox(height: 30,),
                  Text(
                    "Order No : ${controller.ordersHeaderList[index].id}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Number of Items : $quantity",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    "Order Total : $total",
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
