import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
import 'package:meaw/Model/category_model.dart';
import 'package:meaw/Model/products_model.dart';
// import 'package:meaw/utils/my_string.dart';

class CategoryServices {
  static Future<List<CategoryModel>> getCategories() async {
    // var response = await http.get(Uri.parse('$baseUrlApis/category'));
    String data = await rootBundle.loadString('assets/jsondata/category.json');
    // if(response.statusCode == 200){
    //   var jsonData = response.body;
    //   // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
    //   return categoryModelFromJson(jsonData);
    // }
    // else{
    //   return throw Exception("Failed to load categories");
    // }
    return categoryModelFromJson(data);
  }
}


class AllCategoryServices {
  static Future<List<ProductsModel>> getAllCategory(String categoryName) async {
    // var response = await http.get(Uri.parse('$baseUrlApis/Items/ItemsGetByCategory?id=$categoryName'));
    var data = await rootBundle.loadString('assets/jsondata/items.json');
    var jsonData = productsModelFromJson(data);
    var js = jsonData.where((element) => element == categoryName);
    print(js.length);
    return jsonData;
    // if(response.statusCode == 200){
    //   var jsonData = response.body;
    //   // var data = List<Map<String, ProductsModel>>.from(jsonDecode(response.body));
    //   return productsModelFromJson(jsonData);
    // }
    // else{
    //   return throw Exception("Failed to load categories");
    // }
  }
}