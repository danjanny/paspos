import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/fetch_detail_product_cubit/fetch_detail_product_cubit.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/custom_app_bar/detail_app_bar.dart';
import 'package:paspos/module/presentation/widgets/product_detail_page/add_to_cart_widget.dart';

import '../../utils/colors.dart';
import '../../utils/viewport_util.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    var params = {'userId': "3", "productId": "1"};
    context.read<FetchDetailProductCubit>().getProduct(params);
  }

  @override
  Widget build(BuildContext context) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, PasposColor.borderColor);

    return PasposMainView(
        mainView: Stack(children: [
      Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              CarouselSlider(items: [
                Image.asset("assets/products/img.png",
                    width: viewportUtil.maxWidth),
                Image.asset("assets/products/img_1.png"),
                Image.asset("assets/products/img_2.png"),
                Image.asset("assets/products/img_3.png"),
                Image.asset("assets/products/img_4.png"),
              ], options: CarouselOptions(height: 200.0)),
              ...List.generate(20, (index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(index.toString()),
                );
              }).toList(),
              const SizedBox(height: 50.0)
            ],
          )),
      const Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: DetailAppBar(
          color: Colors.transparent,
        ),
      ),
      const Positioned(
          bottom: 0.0, left: 0.0, right: 0.0, child: AddToCartWidget())
    ]));
  }
}
