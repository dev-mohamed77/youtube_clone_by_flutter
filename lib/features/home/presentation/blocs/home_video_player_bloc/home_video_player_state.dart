import 'package:equatable/equatable.dart';
import 'package:miniplayer/miniplayer.dart';

class HomeVideoPlayerState extends Equatable {
  final bool showMiniPlayer;
  final MiniplayerController? miniplayerController;
  const HomeVideoPlayerState({
    required this.showMiniPlayer,
    this.miniplayerController,
  });
  @override
  List<Object?> get props => [showMiniPlayer, miniplayerController];
}
