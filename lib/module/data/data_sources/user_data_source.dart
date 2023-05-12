import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/data_sources/i_user_data_source.dart';
import 'package:http/http.dart' as http;

@Injectable(as: IUserDataSource)
class UserDataSource implements IUserDataSource {
  @override
  Future<http.Response> getUserResponse(
      Map<String, dynamic> bodyRequest) async {
    return http.post(
        Uri.parse(
            'https://run.mocky.io/v3/bb9d8a1b-f643-4dd0-8c42-36b29735490b'),
        headers: {},
        body: jsonEncode({}));
  }
}
