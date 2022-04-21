import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  final int? id;
  final String? code;
  final String? name;
  final String? descriptions;
  final double? price;
  final int? qty;
  final int? categoryId;
  final String? categoryName;
  final String? imgUrl;
  final double? rate;

  ProductsModel({
    this.id,
    this.code,
    this.name,
    this.descriptions,
    this.price,
    this.qty,
    this.categoryId,
    this.categoryName,
    this.imgUrl,
    this.rate,
  });

  ProductsModel.fromJson(Map<String, dynamic> json)
      : id = json['Id'] as int?,
        code = json['Code'] as String?,
        name = json['Name'] as String?,
        descriptions = json['Descriptions'] as String?,
        price = json['Price'] as double?,
        qty = json['Qty'] as int?,
        categoryId = json['CategoryId'] as int?,
        categoryName = json['CategoryName'] as String?,
        imgUrl = json['ImgUrl'] as String?,
        rate = json['Rate'] as double?;

  Map<String, dynamic> toJson() => {
    'Id' : id,
    'Code' : code,
    'Name' : name,
    'Descriptions' : descriptions,
    'Price' : price,
    'Qty' : qty,
    'CategoryId' : categoryId,
    'CategoryName' : categoryName,
    'ImgUrl' : imgUrl,
    'Rate' : rate
  };
}