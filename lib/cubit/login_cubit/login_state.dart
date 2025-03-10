part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoding extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginWrongPasswrodOrEmail extends LoginState {}
final class LoginFauild extends LoginState {
  final String error;
  LoginFauild( { required this.error});
}
