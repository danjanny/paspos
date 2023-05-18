import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:paspos/module/api/api_mock.dart';
import 'package:paspos/module/data/data_sources/i_product_data_source.dart';
import 'package:paspos/module/utils/global_util.dart';

@Injectable(as: IProductDataSource)
class ProductDataSource implements IProductDataSource {
  @override
  Future<http.Response> getAllProduct(Map<String, dynamic> params) {
    String queryString = Uri(
        queryParameters:
            params.map((key, value) => MapEntry(key, value.toString()))).query;

    String url = '${ApiMock.productsResponseSuccess}?$queryString';
    logSystem((ProductDataSource()).toString(), "url products", url);

    return http.get(Uri.parse(url), headers: {});
  }

  @override
  Future<http.Response> getProduct(Map<String, dynamic> params) {
    String queryString = Uri(
        queryParameters:
            params.map((key, value) => MapEntry(key, value.toString()))).query;

    String url = '${ApiMock.productResponseSuccess}?$queryString';
    logSystem((ProductDataSource()).toString(), "url product", url);

    return http.get(Uri.parse(url), headers: {});
  }
}
