import 'package:get/get.dart';
import 'package:meaw/logic/Controller/category_controller.dart';
import 'package:meaw/logic/Controller/products_controller.dart';

import '../Controller/cart_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}