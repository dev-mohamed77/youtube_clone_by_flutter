// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:miniplayer/miniplayer.dart';

class HomeVideoPlayerState extends Equatable {
  final bool showMiniPlayer;
  final bool showProfile;
  final MiniplayerController? miniplayerController;
  const HomeVideoPlayerState({
    required this.showMiniPlayer,
    required this.showProfile,
    this.miniplayerController,
  });
  @override
  List<Object?> get props =>
      [showMiniPlayer, miniplayerController, showProfile];
}
