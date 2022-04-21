import 'dart:io';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
import 'package:meaw/Model/products_model.dart';
import 'package:meaw/main.dart';
// import 'package:meaw/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductsModel>> getProduct() async {
    HttpOverrides.global = MyHttpOverrides();
    // var response = await http.get(Uri.parse('$baseUrlApis/items'));
    String data = await rootBundle.loadString('assets/jsondata/items.json');
    // if(response.statusCode == 200){
    //   var jsonData = response.body;
    //   // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
    //   return productsModelFromJson(jsonData);
    // }
    //   else{
    //     return throw Exception("Failed to load products");
    //   }
    // }
    return productsModelFromJson(data);
  }
}