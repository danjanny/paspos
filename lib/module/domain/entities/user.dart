import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? fullName;

  User({this.id, this.username, this.email, this.phoneNumber, this.fullName});

  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, phoneNumber: $phoneNumber, fullName: $fullName}';
  }

  @override
  List<Object?> get props => [id, username, email, phoneNumber, fullName];
}
