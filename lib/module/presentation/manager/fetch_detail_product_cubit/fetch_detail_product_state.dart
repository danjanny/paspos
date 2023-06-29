import 'package:equatable/equatable.dart';
import 'package:paspos/module/data/models/product_model.dart';

abstract class FetchDetailProductState extends Equatable {
  const FetchDetailProductState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialFetchDetailProductState extends FetchDetailProductState {}

class LoadingFetchDetailProductState extends FetchDetailProductState {}

class GeneralErrorFetchDetailProductState extends FetchDetailProductState {
  final String? responseMessage;

  const GeneralErrorFetchDetailProductState(this.responseMessage);
}

class DataNotFoundFetchDetailProductState extends FetchDetailProductState {
  final String? responseMessage;

  const DataNotFoundFetchDetailProductState(this.responseMessage);
}

class OfflineFetchDetailProductState extends FetchDetailProductState {}

class TimeoutFetchDetailProductState extends FetchDetailProductState {}

class LoadedFetchDetailProductState extends FetchDetailProductState {
  final ProductModel? product;

  const LoadedFetchDetailProductState({this.product});
}
