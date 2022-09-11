import 'package:youtube_clone/core/services/network_services/network_service.dart';

import '../model/videos_model.dart';
import '../model/video_with_message.dart';

abstract class HomeRemoteDataSource {
  Future<VideoWithMessage> addVideo();
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
  Future<VideoWithMessage> addVideo() async {
    final response = await netWorkService.postData(
      "/videos/",
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
    final response = await netWorkService.getData("/videos/sub");

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
