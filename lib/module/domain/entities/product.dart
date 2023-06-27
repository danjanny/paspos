import 'package:equatable/equatable.dart';

class Product implements Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final List<String>? productImageUrl;
  final String? desc;
  final String? price;
  final String? qty;
  final String? totalPrice;

  Product(
      {this.id,
      this.name,
      this.imageUrl,
      this.productImageUrl,
      this.desc,
      this.price,
      this.qty,
      this.totalPrice = ""});

  @override
  List<Object?> get props =>
      [id, name, imageUrl, productImageUrl, desc, price, qty, totalPrice];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'Product{id: $id, name: $name, imageUrl: $imageUrl, productImageUrl: ${productImageUrl?.length} desc: $desc, price: $price, qty: $qty, totalPrice: $totalPrice}';
  }
}
