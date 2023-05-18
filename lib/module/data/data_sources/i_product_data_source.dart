import 'package:http/http.dart' as http;

abstract class IProductDataSource {
  Future<http.Response> getAllProduct(Map<String, dynamic> params);

  Future<http.Response> getProduct(Map<String, dynamic> params);
}
