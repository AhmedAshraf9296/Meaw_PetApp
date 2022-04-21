import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meaw/utils/my_string.dart';

class OrderServices {
  static Future postOrderHeader(
      int noItems,
      int deliveryTypeId,
      dynamic total,
      int deliveryFees,
      dynamic netTotal,
      String customerEmail,
      refrenceId,
      bool homeDelivery,
      bool onSite) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(Uri.parse("$baseUrlApis/orders/orderheader"),
        body: jsonEncode({
          "noItems": '$noItems',
          "deliveryTypeId": '$deliveryTypeId',
          "total": '$total',
          "deliveryFees": '$deliveryFees',
          "netTotal": '$netTotal',
          "customerEmail": customerEmail,
          "refrenceId": '$refrenceId',
          "homeDelivery": '$homeDelivery',
          "onSite": '$onSite',
        }),headers: headers);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return jsonData;
    }
    else{
      return throw Exception("Failed to post the data");
    }
  }


  static Future postOrderDetail(
  dynamic refrenceId,
  dynamic itemLineNo,
  dynamic itemId,
  dynamic qty,
  dynamic price,
  dynamic total,
  dynamic netTotal) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(Uri.parse("$baseUrlApis/orders/orderdetail"),
        body: jsonEncode({
          "refrenceId": '$refrenceId',
          "itemLineNo": '$itemLineNo',
          "itemId": '$itemId',
          "qty": '$qty',
          "price": '$price',
          "total": '$total',
          "netTotal": '$netTotal'
        }),headers: headers);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return jsonData;
    }
    else{
      return throw Exception("Failed to post the data");
    }
  }


}
