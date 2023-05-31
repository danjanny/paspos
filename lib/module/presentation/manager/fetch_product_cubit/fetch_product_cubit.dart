import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/models/product_model.dart';
import 'package:paspos/module/data/models/product_response_model.dart';
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_state.dart';
import 'package:paspos/module/utils/global_util.dart';

import '../../../domain/use_cases/i_get_product_use_case.dart';
import 'package:http/http.dart' as http;

@injectable
class FetchProductCubit extends Cubit<FetchProductState> {
  IGetProductUseCase? getProductUseCase;

  FetchProductCubit(this.getProductUseCase) : super(InitialFetchProductState());

  void getAllProduct(Map<String, dynamic> params) async {
    emit(LoadingFetchProductState());
    try {
      http.Response response = await getProductUseCase!
          .getAllProduct(params)
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        logSystem((FetchProductCubit(getProductUseCase)).toString(), "products",
            response.body);
        var productResponseModel =
            ProductResponseModel.fromJson(jsonDecode(response.body));

        emit(LoadedFetchProductState(products: productResponseModel.products));
      } else if (response.statusCode == 401) {
        // expired token, do refresh token
      } else if (response.statusCode == 404) {
        // data not found
        Map<String, dynamic> mapBodyResponse = jsonDecode(response.body);
        emit(DataNotFoundFetchProductState(mapBodyResponse['responseMessage']));
      } else {
        // selain 200, 401, 404
        Map<String, dynamic> mapBodyResponse = jsonDecode(response.body);
        emit(GeneralErrorFetchProductState(mapBodyResponse['responseMessage']));
      }
    } on http.ClientException catch (e) {
      // offline
      emit(OfflineFetchProductState());
    } on SocketException catch (e) {
      // offline
      emit(TimeoutFetchProductState());
    } on TimeoutException catch (e) {
      emit(TimeoutFetchProductState());
    } catch (e) {
      emit(const GeneralErrorFetchProductState("General Error"));
    }
  }
}
