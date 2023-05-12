import 'package:http/http.dart' as http;

abstract class IUserDataSource {
  Future<http.Response> getUserResponse(Map<String, dynamic> bodyRequest);
}
