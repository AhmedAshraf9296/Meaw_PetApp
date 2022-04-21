// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  OrderDetailModel({
    required this.refrenceId,
    required this.itemLineNo,
    required this.itemId,
    required this.qty,
    required this.price,
    required this.total,
    required this.netTotal,
  });

  int refrenceId;
  int itemLineNo;
  int itemId;
  int qty;
  int price;
  int total;
  int netTotal;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    refrenceId: json["refrenceId"],
    itemLineNo: json["itemLineNo"],
    itemId: json["itemId"],
    qty: json["qty"],
    price: json["price"],
    total: json["total"],
    netTotal: json["netTotal"],
  );

  Map<String, dynamic> toJson() => {
    "refrenceId": refrenceId,
    "itemLineNo": itemLineNo,
    "itemId": itemId,
    "qty": qty,
    "price": price,
    "total": total,
    "netTotal": netTotal,
  };
}
