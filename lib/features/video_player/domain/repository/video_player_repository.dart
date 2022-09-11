import 'package:youtube_clone/core/services/network_services/api_result.dart';

import '../../../home/data/model/get_status_sbscriber.dart';
import '../../data/model/message_result_model.dart';
import '../../data/model/video_player_model.dart';

abstract class VideoPlayerRepository {
  Future<ApiResult<VideoPlayerModel>> getVideo(String videoId); //
  Future<ApiResult<MessageResultModel>> addView(String videoId); //
  // likes and desLikes
  Future<ApiResult<MessageResultModel>> addLikeForVideo();
  Future<ApiResult<MessageResultModel>> addDesLikeForVideo();
  Future<ApiResult<MessageResultModel>> deleteLikeForVideo();
  Future<ApiResult<MessageResultModel>> deleteDesLikeForVideo();
  // comments
  Future<ApiResult<MessageResultModel>> addComment();
  Future getCommentsByVideo(); //
  Future getCommentById();
  Future<ApiResult<MessageResultModel>> deleteComment();
  Future updateComment();
  // subscriber
  Future<ApiResult<MessageResultModel>> addSubscriber();
  Future<ApiResult<GetStatusSubscriber>> getStatusSubscriberChannel(); //
  Future<ApiResult<MessageResultModel>> addSubscriberAndUnSubscriber();
}
