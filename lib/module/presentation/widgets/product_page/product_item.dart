import 'package:flutter/material.dart';
import 'package:paspos/module/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? productModel;

  const ProductItem({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 3.0, top: 3.0),
      // color: Colors.cyan,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.asset("assets/images/hotel.png",
                width: 50.0, height: 50.0, fit: BoxFit.cover),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            flex: 2,
            child: Text(
              productModel!.name!,
              style: const TextStyle(fontSize: 12.0),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                'Rp ${productModel!.price!}',
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w600),
              ),
              // color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
