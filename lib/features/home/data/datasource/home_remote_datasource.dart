import 'dart:io';

import 'package:dio/dio.dart';
import 'package:youtube_clone/core/services/network_services/network_service.dart';

import '../../../../getit_injection.dart';
import '../../../auth/data/datasource/auth_local_database.dart';
import '../model/videos_model.dart';
import '../model/video_with_message.dart';

abstract class HomeRemoteDataSource {
  Future<VideoWithMessage> addVideo({
    required File videoFile,
    required String title,
    required String description,
  });
  Future<List<VideosDataModel>> getVideosRandom({
    required int limit,
    required int page,
  });
  Future<List<VideosDataModel>> getVideosSub();

  Future<List<VideosDataModel>> getVideosTrend({
    required int limit,
    required int page,
  });
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  final NetWorkService netWorkService;

  const HomeRemoteDataSourceImp({
    required this.netWorkService,
  });

  @override
  Future<VideoWithMessage> addVideo({
    required File videoFile,
    required String title,
    required String description,
  }) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();

    String fileName = videoFile.path.split('/').last;

    FormData formData = FormData.fromMap({
      "video": await MultipartFile.fromFile(videoFile.path, filename: fileName),
      "title": title,
      "description": description,
    });

    final response = await netWorkService.postData(
      "/videos/",
      data: formData,
      token: "Bearer ${currentUser["token"]}",
    );

    final model = VideoWithMessage.fromMap(response.data);
    return model;
  }

  @override
  Future<List<VideosDataModel>> getVideosRandom({
    required int limit,
    required int page,
  }) async {
    final response = await netWorkService.getData("/videos", queryParams: {
      "limit": limit,
      "pages": page,
    });

    Iterable data = response.data["result"];

    List<VideosDataModel> result = data.map((video) {
      return VideosDataModel.fromMap(video);
    }).toList();

    return result;
  }

  @override
  Future<List<VideosDataModel>> getVideosSub() async {
    final currentUser = await await getIt<AuthLocalDataSource>().getUser();

    final response = await netWorkService.getData(
      "/videos/sub",
      token: "Bearer ${currentUser["token"]}",
    );

    Iterable data = response.data["result"];

    List<VideosDataModel> result = data.map((video) {
      return VideosDataModel.fromMap(video);
    }).toList();

    return result;
  }

  @override
  Future<List<VideosDataModel>> getVideosTrend({
    required int limit,
    required int page,
  }) async {
    final response =
        await netWorkService.getData("/videos/trend", queryParams: {
      "limit": limit,
      "pages": page,
    });

    Iterable data = response.data["result"];

    List<VideosDataModel> result = data.map((video) {
      return VideosDataModel.fromMap(video);
    }).toList();

    return result;
  }
}
