part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailed extends AuthState {
  final String? error;
  AuthFailed({this.error});
}

class RegisterSuccess extends AuthState {}

class LoginSuccess extends AuthState {}

class LogOutSuccess extends AuthState {}
