import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/data/models/product_model.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_cubit.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_state.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/product_page/custom_app_bar.dart';
import 'package:paspos/module/presentation/widgets/product_page/product_item.dart';

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
          BlocConsumer<FetchProductCubit, FetchProductState>(
              builder: (ctx, state) {
                if (state is LoadingFetchProductState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GeneralErrorFetchProductState) {
                  String responseMessage = state.responseMessage!;
                  return Container(
                    color: Colors.orange,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(responseMessage)],
                    ),
                  );
                } else if (state is OfflineFetchProductState) {
                  return Container(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Offline')],
                    ),
                  );
                } else if (state is TimeoutFetchProductState) {
                  return Container(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Time out')],
                    ),
                  );
                } else if (state is DataNotFoundFetchProductState) {
                  String responseMessage = state.responseMessage!;
                  return Container(
                    color: Colors.blueGrey,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(responseMessage)],
                    ),
                  );
                } else if (state is LoadedFetchProductState) {
                  List<ProductModel> products = state.products!;
                  return Container(
                      margin: EdgeInsets.only(top: 50.0),
                      child: ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (ctx, i) {
                            return ProductItem(
                              productModel: products[i],
                            );
                          }));
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Default State')],
                    ),
                  );
                }
              },
              listener: (ctx, state) {}),
          const CustomAppBar(),
        ],
      )),
    ));
  }
}
