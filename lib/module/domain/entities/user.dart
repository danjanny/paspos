import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? fullName;
  final String? password;

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
