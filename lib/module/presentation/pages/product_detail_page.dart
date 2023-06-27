import 'package:flutter/material.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasposMainView(
        mainView: Container(
          alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: Text('Product Detail Page')));
  }
}
