import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';

import '../../../domain/repository/repository.dart';
import 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;
  AuthBloc({
    required this.repo,
  }) : super(AuthStateInit()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginStateLoading());
      var result =
          await repo.login(username: event.username, password: event.password);

      result.when(success: ((data) {
        emit(
          LoginStateSuccess(data),
        );
      }), failure: (error) {
        emit(
          LoginStateFailure(
            ErrorHandle.getErrorMessage(error),
          ),
        );
      });
    });

    on<RegisterEvent>((event, emit) async {
      emit(RegisterStateLoading());
      final result = await repo.register(
        fullname: event.fullname,
        username: event.username,
        email: event.email,
        password: event.password,
      );

      result.when(success: ((data) {
        emit(RegisterStateSuccess(data));
      }), failure: (err) {
        emit(RegisterStateFailure(ErrorHandle.getErrorMessage(err)));
      });
    });
  }
}
