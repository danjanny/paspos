import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_state.dart';
import 'package:paspos/module/utils/global_util.dart';

import '../../../domain/use_cases/i_get_product_use_case.dart';
import 'package:http/http.dart' as http;

@injectable
class FetchProductCubit extends Cubit<FetchProductState> {
  IGetProductUseCase? getProductUseCase;

  FetchProductCubit(this.getProductUseCase) : super(InitialFetchProductState());

  void getAllProduct(Map<String, dynamic> params) async {
    emit(InitialFetchProductState());
    http.Response response = await getProductUseCase!.getAllProduct(params);
    logSystem((FetchProductCubit(this.getProductUseCase)).toString(),
        "fetch all product", response.body);
  }
}
