import 'package:http/http.dart' as http;

abstract class IUserLoginUseCase {
  Future<http.Response> getUser(Map<String, dynamic> bodyRequest);
}
