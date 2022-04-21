import 'package:flutter/material.dart';
import 'package:meaw/Model/products_model.dart';
import 'package:meaw/View/widgets/productDetails/image_sliders.dart';
import 'package:meaw/View/widgets/productDetails/product_info.dart';
import 'package:meaw/View/widgets/productDetails/size_list.dart';
import 'package:meaw/View/widgets/theme.dart';

import '../widgets/productDetails/add_cart.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetailsScreen({Key? key,required this.productsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Get.isDarkMode ? Colors.white : secondalymainColor,
        backgroundColor:secondalymainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                ImageSliders(
                  imageUrl:productsModel.imgUrl!,
                ),
                ProductInfo(title: productsModel.name!,productId: productsModel.id!,rate: productsModel.rate!,description: productsModel.descriptions!,),
                const SizeList(),
                AddCart(price: productsModel.price!,productsModel: productsModel,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
