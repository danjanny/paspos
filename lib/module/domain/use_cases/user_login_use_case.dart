import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:paspos/module/domain/repositories/i_user_repository.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';

@Injectable(as: IUserLoginUseCase)
class UserLoginUseCase implements IUserLoginUseCase {
  IUserRepository? userRepository;

  UserLoginUseCase(this.userRepository);

  @override
  Future<http.Response> getUser(Map<String, dynamic> bodyRequest) {
    return userRepository!.getUserResponse(bodyRequest);
  }
}
