// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:youtube_clone/features/home/data/model/videos_model.dart';

abstract class HomeState extends Equatable {}

class HomeStateGetVideosSuccess extends HomeState {
  final List<VideosDataModel> videos;
  HomeStateGetVideosSuccess({
    required this.videos,
  });
  @override
  List<Object?> get props => [videos];
}

class HomeStateGetVideosLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateGetVideosError extends HomeState {
  final String err;
  HomeStateGetVideosError({
    required this.err,
  });
  @override
  List<Object?> get props => [err];
}
