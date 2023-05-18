import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/data_sources/i_product_data_source.dart';
import 'package:paspos/module/domain/repositories/i_product_repository.dart';

@Injectable(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final IProductDataSource? productDataSource;

  ProductRepository(this.productDataSource);

  @override
  Future<http.Response> getAllProduct(Map<String, dynamic> params) {
    return productDataSource!.getAllProduct(params);
  }

  @override
  Future<http.Response> getProduct(Map<String, dynamic> params) {
    return productDataSource!.getProduct(params);
  }
}
