import 'package:flutter/foundation.dart';
import 'package:paspos/module/domain/entities/user.dart';

class UserModel extends User {
  UserModel({@required id, @required phoneNumber})
      : super(id: id, phoneNumber: phoneNumber);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], phoneNumber: json['phoneNumber']);
  }
}
