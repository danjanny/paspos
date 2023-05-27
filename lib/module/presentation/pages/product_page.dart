import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_cubit.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_state.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/product_page/custom_app_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    var params = {'userId': "3", "query": ""};
    context.read<FetchProductCubit>().getAllProduct(params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: PasposMainView(
          mainView: Stack(
        children: [
          const CustomAppBar(),
          BlocConsumer<FetchProductCubit, FetchProductState>(
              builder: (ctx, state) {
                return Container(
                  color: Colors.orange,
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('ListView of product')],
                  ),
                );
              },
              listener: (ctx, state) {})
        ],
      )),
    ));
  }
}
