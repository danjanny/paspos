import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/models/product_detail_response_model.dart';
import 'package:paspos/module/presentation/manager/fetch_detail_product_cubit/fetch_detail_product_state.dart';
import 'package:paspos/module/utils/global_util.dart';

import '../../../domain/use_cases/i_get_product_use_case.dart';
import 'package:http/http.dart' as http;

@injectable
class FetchDetailProductCubit extends Cubit<FetchDetailProductState> {
  IGetProductUseCase? getProductUseCase;

  FetchDetailProductCubit({this.getProductUseCase})
      : super(InitialFetchDetailProductState());

  Future<void> getProduct(Map<String, dynamic> params) async {
    emit(LoadingFetchDetailProductState());
    try {
      http.Response response = await getProductUseCase!
          .getProduct(params)
          .timeout(const Duration(seconds: 60));

      var productDetailResponseModel =
          ProductDetailResponseModel.fromJson(jsonDecode(response.body));

      logSystem((FetchDetailProductCubit()).toString(),
          "product detail http response", response.body);

      logSystem((FetchDetailProductCubit()).toString(), "product detail model",
          '${productDetailResponseModel.data!.id!}, ${productDetailResponseModel.data!.name!},           ${productDetailResponseModel.data!.productImageUrl!.length}');
    } on http.ClientException catch (e) {
      emit(OfflineFetchDetailProductState());
    } on SocketException catch (e) {
      emit(TimeoutFetchDetailProductState());
    } on TimeoutException catch (e) {
      emit(TimeoutFetchDetailProductState());
    } catch (e) {
      emit(const GeneralErrorFetchDetailProductState("General Error"));
    }
  }
}
