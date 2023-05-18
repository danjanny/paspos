import 'package:flutter/foundation.dart';
import 'package:paspos/module/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {@required id,
      @required name,
      @required imageUrl,
      @required desc,
      @required price,
      @required qty,
      @required totalPrice})
      : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            desc: desc,
            price: price,
            qty: qty,
            totalPrice: totalPrice);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        desc: json['desc'],
        price: json['price'],
        qty: json['qty'],
        totalPrice: json['totalPrice']);
  }
}
