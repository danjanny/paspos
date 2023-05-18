import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';
import 'package:paspos/module/utils/global_util.dart';

import '../repositories/i_user_repository.dart';

@Injectable(as: IUserLoginUseCase)
class UserLoginFormUseCase implements IUserLoginUseCase {
  IUserRepository? userRepository;

  UserLoginFormUseCase(this.userRepository);

  @override
  Future<Response> getUser(Map<String, dynamic> bodyRequest) {
    logSystem((UserLoginFormUseCase(userRepository)).toString(), "use case",
        jsonEncode(bodyRequest));
    return userRepository!.getUserResponse(bodyRequest);
  }
}
