import 'package:equatable/equatable.dart';
import 'package:paspos/module/domain/entities/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class GeneralErrorLoginState extends LoginState {
  final String? responseMessage;

  const GeneralErrorLoginState({this.responseMessage});
}

class InvalidUserLoginState extends LoginState {
  final String? responseMessage;

  const InvalidUserLoginState({this.responseMessage});
}

class OfflineLoginState extends LoginState {}

class TimeoutLoginState extends LoginState {}

class LoadedLoginState extends LoginState {
  final User? user;

  const LoadedLoginState({this.user});
}
