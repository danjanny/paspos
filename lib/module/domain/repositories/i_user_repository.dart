import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<http.Response> getUserResponse(Map<String, dynamic> bodyRequest);
}
