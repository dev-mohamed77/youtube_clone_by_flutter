// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeEventGetVideosRandom extends HomeEvent {
  final int limit;
  final int page;
  HomeEventGetVideosRandom({
    required this.limit,
    required this.page,
  });
  @override
  List<Object?> get props => [limit, page];
}

class HomeEventGetVideosSub extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeEventGetVideosTrend extends HomeEvent {
  final int limit;
  final int page;
  HomeEventGetVideosTrend({
    required this.limit,
    required this.page,
  });
  @override
  List<Object?> get props => [limit, page];
}
