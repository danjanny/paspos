import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/api/api_mock.dart';
import 'package:paspos/module/data/data_sources/i_user_data_source.dart';
import 'package:http/http.dart' as http;

@Injectable(as: IUserDataSource)
class UserDataSource implements IUserDataSource {
  @override
  Future<http.Response> getUserResponse(
      Map<String, dynamic> bodyRequest) async {
    return http.post(Uri.parse(ApiMock.responseSuccess),
        headers: {}, body: jsonEncode({}));
  }
}
