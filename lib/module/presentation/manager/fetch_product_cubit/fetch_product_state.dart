import 'package:equatable/equatable.dart';
import 'package:paspos/module/data/models/product_model.dart';

import '../../../domain/entities/product.dart';

abstract class FetchProductState extends Equatable {
  const FetchProductState();

  @override
  List<Object?> get props => [];
}

class InitialFetchProductState extends FetchProductState {}

class LoadingFetchProductState extends FetchProductState {}

class GeneralErrorFetchProductState extends FetchProductState {
  final String? responseMessage;

  const GeneralErrorFetchProductState(this.responseMessage);
}

class DataNotFoundFetchProductState extends FetchProductState {
  final String? responseMessage;

  const DataNotFoundFetchProductState(this.responseMessage);
}

class OfflineFetchProductState extends FetchProductState {}

class TimeoutFetchProductState extends FetchProductState {}

class LoadedFetchProductState extends FetchProductState {
  final List<ProductModel>? products;

  const LoadedFetchProductState({this.products});
}
