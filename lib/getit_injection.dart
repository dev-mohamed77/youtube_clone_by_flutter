import 'package:get_it/get_it.dart';
import 'package:youtube_clone/core/services/network_services/network_service.dart';
import 'package:youtube_clone/features/home/data/datasource/home_remote_datasource.dart';
import 'package:youtube_clone/features/home/data/repository_imp/repository_imp.dart';
import 'package:youtube_clone/features/home/domain/repository/home_repository.dart';
import 'package:youtube_clone/features/video_player/data/data_source/video_player_remote_data_source.dart';
import 'package:youtube_clone/features/video_player/domain/repository/video_player_repository.dart';
import 'features/auth/data/datasource/auth_local_database.dart';
import 'features/auth/data/datasource/auth_remote_datasource.dart';
import 'features/auth/data/repository_imp/reposetory_imp.dart';
import 'features/auth/domain/repository/repository.dart';
import 'features/video_player/data/repository_imp/video_player_repository_imp.dart';

GetIt getIt = GetIt.instance;

void init() {
  // Common
  getIt.registerLazySingleton<NetWorkService>(
    () => DioService(),
  );

  // Auth
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImp(),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImp(getIt<NetWorkService>()),
  );

  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImp(
      localDataSource: getIt<AuthLocalDataSource>(),
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  //Home
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImp(
      netWorkService: getIt<NetWorkService>(),
    ),
  );

  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImp(
      remoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );

  // video Player
  getIt.registerLazySingleton<VideoPlayerRemoteDataSource>(
    () => VideoPlayerRemoteDataSourceImp(
      netWorkService: getIt<NetWorkService>(),
    ),
  );

  getIt.registerFactory<VideoPlayerRepository>(
    () => VideoPlayerRepositoryImp(
      remoteDataSource: getIt<VideoPlayerRemoteDataSource>(),
    ),
  );
}
