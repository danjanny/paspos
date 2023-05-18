import 'package:injectable/injectable.dart';
import 'package:paspos/module/domain/repositories/i_product_repository.dart';
import 'package:paspos/module/domain/use_cases/i_get_product_use_case.dart';
import 'package:http/http.dart' as http;

@Injectable(as: IGetProductUseCase)
class GetProductUseCase implements IGetProductUseCase {
  final IProductRepository? productRepository;

  GetProductUseCase(this.productRepository);

  @override
  Future<http.Response> getAllProduct(Map<String, dynamic> params) {
    return productRepository!.getAllProduct(params);
  }

  @override
  Future<http.Response> getProduct(Map<String, dynamic> params) {
    return productRepository!.getProduct(params);
  }
}
