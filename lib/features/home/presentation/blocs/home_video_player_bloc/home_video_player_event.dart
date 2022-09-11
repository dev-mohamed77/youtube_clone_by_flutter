// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:miniplayer/miniplayer.dart';

abstract class HomeVideoPlayerEvent extends Equatable {}

class GetHomeVideoPlayerEvent extends HomeVideoPlayerEvent {
  final bool showMiniPlayer;
  final MiniplayerController? miniplayerController;
  GetHomeVideoPlayerEvent({
    required this.showMiniPlayer,
    this.miniplayerController,
  });
  @override
  List<Object?> get props => [showMiniPlayer, miniplayerController];
}
