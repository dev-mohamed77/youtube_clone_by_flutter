import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/features/home/data/model/video_with_message.dart';
import 'package:youtube_clone/features/home/data/model/videos_model.dart';

abstract class HomeRepository {
  Future<ApiResult<VideoWithMessage>> addVideo();
  Future<ApiResult<List<VideosDataModel>>> getVideosRandom({
    required int limit,
    required int page,
  });
  Future<ApiResult<List<VideosDataModel>>> getVideosSub();
  Future<ApiResult<List<VideosDataModel>>> getVideosTrend({
    required int limit,
    required int page,
  });
}
