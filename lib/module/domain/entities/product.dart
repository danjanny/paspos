import 'package:equatable/equatable.dart';

class Product implements Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? desc;
  final String? price;
  final String? qty;
  final String? totalPrice;

  Product(
      {this.id,
      this.name,
      this.imageUrl,
      this.desc,
      this.price,
      this.qty,
      this.totalPrice = ""});

  @override
  List<Object?> get props => [id, name, imageUrl, desc, price, qty, totalPrice];

  @override
  bool? get stringify => true;
}
