// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:youtube_clone/features/profile/data/model/profile_model.dart';

abstract class ProfileState extends Equatable {}

class GetProfileStateLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class GetProfileStateSuccess extends ProfileState {
  final ProfileModel data;
  GetProfileStateSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

class GetProfileStateError extends ProfileState {
  final String error;
  GetProfileStateError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
