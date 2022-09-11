part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent({
    required this.fullname,
    required this.username,
    required this.email,
    required this.password,
  });
  final String fullname;
  final String username;
  final String email;
  final String password;
}
