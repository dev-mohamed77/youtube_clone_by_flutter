import 'package:equatable/equatable.dart';
import 'package:youtube_clone/features/auth/data/model/register_model.dart';

import '../../../data/model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStateInit extends AuthState {}

class LoginStateLoading extends AuthState {}

class LoginStateSuccess extends AuthState {
  final User user;

  LoginStateSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

class LoginStateFailure extends AuthState {
  final String message;

  LoginStateFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class RegisterStateLoading extends AuthState {}

class RegisterStateSuccess extends AuthState {
  final RegisterModel data;

  RegisterStateSuccess(this.data);
  @override
  List<Object?> get props => [data];
}

class RegisterStateFailure extends AuthState {
  final String message;

  RegisterStateFailure(this.message);
  @override
  List<Object?> get props => [message];
}
