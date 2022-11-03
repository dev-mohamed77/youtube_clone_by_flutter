import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_event.dart';
import 'package:youtube_clone/features/home/presentation/blocs/home_video_player_bloc/home_video_player_state.dart';

class HomeVideoPlayerBloc
    extends Bloc<HomeVideoPlayerEvent, HomeVideoPlayerState> {
  HomeVideoPlayerBloc()
      : super(
          HomeVideoPlayerState(
            showMiniPlayer: true,
            showProfile: true,
            miniplayerController: MiniplayerController(),
          ),
        ) {
    on<GetHomeVideoPlayerShowMiniPlayerWithPanelStateMaxEvent>((event, emit) {
      state.miniplayerController?.animateToHeight(state: PanelState.MAX);
      emit(
        HomeVideoPlayerState(
          miniplayerController: state.miniplayerController,
          showMiniPlayer: event.showMiniPlayer,
          showProfile: state.showProfile,
        ),
      );
    });
    on<GetHomeVideoPlayerPanelStateMinEvent>((event, emit) {
      state.miniplayerController?.animateToHeight(state: PanelState.MIN);

      emit(HomeVideoPlayerState(
        miniplayerController: state.miniplayerController,
        showMiniPlayer: state.showMiniPlayer,
        showProfile: state.showProfile,
      ));
    });
    on<HomeVideoPlayerEventShowProfile>((event, emit) {
      emit(HomeVideoPlayerState(
        miniplayerController: state.miniplayerController,
        showMiniPlayer: state.showMiniPlayer,
        showProfile: event.showProfile,
      ));
    });
  }

  @override
  Future<void> close() {
    state.miniplayerController?.dispose();
    return super.close();
  }
}
