import 'package:paspos/module/data/models/product_model.dart';

class ProductDetailResponseModel {
  final String? responseCode;
  final String? responseMessage;
  final ProductModel? data;

  ProductDetailResponseModel(
      {this.responseCode, this.responseMessage, this.data});

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponseModel(
        responseCode: json['responseCode'],
        responseMessage: json['responseMessage'],
        data: ProductModel.fromJson(json['data']));
  }
}
