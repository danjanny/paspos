import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/checkout_page/submit_checkout_widget.dart';

import '../../utils/colors.dart';
import '../../utils/viewport_util.dart';
import '../widgets/custom_app_bar/detail_app_bar.dart';
import '../widgets/product_detail_page/add_to_cart_widget.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, PasposColor.borderColor);

    return PasposMainView(
        mainView: Stack(
      children: [
        Container(
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                ...List.generate(20, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(index.toString()),
                  );
                }).toList(),
                const SizedBox(height: 75.0)
              ],
            )),
        const Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: DetailAppBar(
            color: Colors.white,
            widgetText:
                Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SubmitCheckoutWidget(
                height: 75.0, backgroundColor: Colors.white))
      ],
    ));
  }
}
