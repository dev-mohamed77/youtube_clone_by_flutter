// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class HomeVideoPlayerEvent extends Equatable {}

class GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent
    extends HomeVideoPlayerEvent {
  final String? id;
  final bool showMiniPlayer;
  GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent(
      {required this.showMiniPlayer, this.id});
  @override
  List<Object?> get props => [showMiniPlayer, id];
}

class GetHomeVideoPlayerPanelStateMinEvent extends HomeVideoPlayerEvent {
  GetHomeVideoPlayerPanelStateMinEvent();
  @override
  List<Object?> get props => [];
}

class HomeVideoPlayerEventShowProfile extends HomeVideoPlayerEvent {
  final bool showProfile;
  HomeVideoPlayerEventShowProfile({
    required this.showProfile,
  });
  @override
  List<Object?> get props => [showProfile];
}
