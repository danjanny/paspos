import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? fullName;
  String? password;

  User(
      {this.id,
      this.username,
      this.email,
      this.phoneNumber,
      this.fullName,
      this.password});

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, phoneNumber: $phoneNumber, fullName: $fullName, password: $password}';
  }

  @override
  List<Object?> get props =>
      [id, username, password, email, phoneNumber, fullName];
}
