import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_state.dart';
import 'package:youtube_clone/features/video_player/presentation/blocs/video_player_bloc/video_player_bloc.dart';

class HomeVideoPlayerBloc
    extends Bloc<HomeVideoPlayerEvent, HomeVideoPlayerState> {
  final VideoPlayerBloc videoPlayerBloc;
  HomeVideoPlayerBloc({
    required this.videoPlayerBloc,
  }) : super(
          const HomeVideoPlayerState(
            showMiniPlayer: true,
          ),
        ) {
    on<GetHomeVideoPlayerEvent>((event, emit) {
      event.miniplayerController?.animateToHeight(state: PanelState.MAX);

      emit(HomeVideoPlayerState(
        miniplayerController: event.miniplayerController,
        showMiniPlayer: event.showMiniPlayer,
      ));
    });
  }

  @override
  Future<void> close() {
    state.miniplayerController?.dispose();
    return super.close();
  }
}
