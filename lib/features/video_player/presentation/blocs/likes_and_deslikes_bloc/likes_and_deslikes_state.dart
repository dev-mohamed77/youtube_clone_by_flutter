// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../data/model/likes_and_deslikes_model.dart';

abstract class LikesAndDesLikesState extends Equatable {}

class LikesAndDesLikesNullState extends LikesAndDesLikesState {
  @override
  List<Object?> get props => [];
}

class LikesAndDesLikesSuccessState extends LikesAndDesLikesState {
  final LikesAndDesLikesModel data;
  LikesAndDesLikesSuccessState({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class LikesAndDesLikesErrorState extends LikesAndDesLikesState {
  final String? err;
  LikesAndDesLikesErrorState({
    required this.err,
  });
  @override
  List<Object> get props => [err!];
}
