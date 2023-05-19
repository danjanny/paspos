import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_cubit.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    var params = {'userId': "3"};
    context.read<FetchProductCubit>().getAllProduct(params);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PasposMainView(mainView: Text('Product Page')),
    );
  }
}
