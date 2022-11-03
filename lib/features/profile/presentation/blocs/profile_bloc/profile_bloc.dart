// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';

import 'package:youtube_clone/features/profile/domain/repository/profile_repository.dart';
import 'package:youtube_clone/features/profile/presentation/blocs/profile_bloc/profile_event.dart';
import 'package:youtube_clone/features/profile/presentation/blocs/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repo;
  ProfileBloc({
    required this.repo,
  }) : super(GetProfileStateLoading()) {
    on<GetProfileEvent>((event, emit) async {
      final result = await repo.getProfile(event.userID);
      result.when(
        success: (data) {
          emit(GetProfileStateSuccess(data: data));
        },
        failure: (err) {
          emit(GetProfileStateError(error: ErrorHandle.getErrorMessage(err)));
        },
      );
    });
  }
}
