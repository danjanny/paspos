import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/data_sources/i_user_data_source.dart';

import '../../domain/repositories/i_user_repository.dart';

@Injectable(as: IUserRepository)
class UserNewRepository implements IUserRepository {
  IUserDataSource? userDataSource;

  UserNewRepository(this.userDataSource);

  @override
  Future<http.Response> getUserResponse(Map<String, dynamic> bodyRequest) {
    return userDataSource!.getUserResponse(bodyRequest);
  }
}
