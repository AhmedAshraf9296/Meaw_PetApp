// To parse this JSON data, do
//
//     final orderHeaderModel = orderHeaderModelFromJson(jsonString);

import 'dart:convert';

OrderHeaderModel orderHeaderModelFromJson(String str) => OrderHeaderModel.fromJson(json.decode(str));

String orderHeaderModelToJson(OrderHeaderModel data) => json.encode(data.toJson());

class OrderHeaderModel {
  OrderHeaderModel({
    required this.noItems,
    required this.deliveryTypeId,
    required this.total,
    required this.deliveryFees,
    required this.netTotal,
    required this.customerEmail,
    required this.refrenceId,
    required this.homeDelivery,
    required this.onSite,
  });

  int noItems;
  int deliveryTypeId;
  int total;
  int deliveryFees;
  int netTotal;
  String customerEmail;
  int refrenceId;
  bool homeDelivery;
  bool onSite;

  factory OrderHeaderModel.fromJson(Map<String, dynamic> json) => OrderHeaderModel(
    noItems: json["noItems"],
    deliveryTypeId: json["deliveryTypeId"],
    total: json["total"],
    deliveryFees: json["deliveryFees"],
    netTotal: json["netTotal"],
    customerEmail: json["customerEmail"],
    refrenceId: json["refrenceId"],
    homeDelivery: json["homeDelivery"],
    onSite: json["onSite"],
  );

  Map<String, dynamic> toJson() => {
    "noItems": noItems,
    "deliveryTypeId": deliveryTypeId,
    "total": total,
    "deliveryFees": deliveryFees,
    "netTotal": netTotal,
    "customerEmail": customerEmail,
    "refrenceId": refrenceId,
    "homeDelivery": homeDelivery,
    "onSite": onSite,
  };
}
