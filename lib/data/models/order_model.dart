// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String paymentMethod;
  String location;
  List<OrderDetail> orderDetail;
  double subTotal;
  double shipping;
  double total;

  OrderModel({
    required this.paymentMethod,
    required this.location,
    required this.orderDetail,
    required this.subTotal,
    required this.shipping,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        paymentMethod: json["paymentMethod"],
        location: json["location"],
        orderDetail: List<OrderDetail>.from(
            json["orderDetail"].map((x) => OrderDetail.fromJson(x))),
        subTotal: json["subTotal"]?.toDouble(),
        shipping: json["shipping"]?.toDouble(),
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "paymentMethod": paymentMethod,
        "location": location,
        "orderDetail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
        "subTotal": subTotal,
        "shipping": shipping,
        "total": total,
      };

  OrderModel.empty()
      : paymentMethod = "",
        location = "",
        orderDetail = [],
        subTotal = 0.0,
        shipping = 0.0,
        total = 0.0;
}

class OrderDetail {
  String id;
  String name;
  double price;
  String brand;
  String color;
  int size;
  int quantity;

  OrderDetail({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.color,
    required this.size,
    required this.quantity
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        name: json["name"],
        price: json["price"]?.toDouble(),
        brand: json["brand"],
        color: json["color"],
        size: json["size"],
        quantity: json["quantity"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "brand": brand,
        "color": color,
        "size": size,
        "quantity": quantity
      };
}
