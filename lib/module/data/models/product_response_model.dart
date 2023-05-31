import 'package:paspos/module/data/models/product_model.dart';

class ProductResponseModel {
  final String? responseCode;
  final String? responseMessage;
  final List<ProductModel>? products;

  ProductResponseModel(
      {this.responseCode, this.responseMessage, this.products});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    // transform json array of data to List<ProductModel>
    var listProduct = json['data'] as List;
    var iterableProduct =
        listProduct.map((product) => ProductModel.fromJson(product));
    var products = List<ProductModel>.from(iterableProduct);

    return ProductResponseModel(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      products: products,
    );
  }

  @override
  String toString() {
    return 'ProductResponseModel{responseCode: $responseCode, responseMessage: $responseMessage, products: ${products!.length}';
  }
}
