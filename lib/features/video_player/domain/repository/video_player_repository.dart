import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';

import '../../data/model/add_comment_model.dart';
import '../../data/model/likes_and_deslikes_model.dart';
import '../../data/model/result_and_message_model.dart';
import '../../data/model/message_model.dart';
import '../../data/model/video_player_model.dart';

abstract class VideoPlayerRepository {
  Future<ApiResult<VideoPlayerModel>> getVideo(String videoId); //
  Future<ApiResult<MessageModel>> addView(String videoId); //
  // likes and desLikes
  Future<ApiResult<LikesAndDesLikesModel>> addLikeAndDeleteForVideo(
      String videoID); //
  Future<ApiResult<LikesAndDesLikesModel>> addDesLikeAndDeleteForVideo(
      String videoID); //
  // comments
  Future<ApiResult<AddCommentModel>> addComment(
      String videoID, String title); //
  Future<ApiResult<List<CommentModel>>> getCommentsByVideo({
    required String videoID,
    required String pages,
    required String limit,
  }); //
  Future<ApiResult<CommentModel>> getCommentById(String commentID); //
  Future<ApiResult<MessageModel>> deleteComment(String commentID); //
  Future<ApiResult<MessageModel>> updateComment(
    String commentID,
    String title,
  ); //
  // subscriber
  Future<ApiResult<ResultAndMessageModel>> getStatusSubscriberChannel(
      String userID); //
  Future<ApiResult<ResultAndMessageModel>> addSubscribe(String userID); //
  Future<ApiResult<ResultAndMessageModel>> unSubscribe(String userID); //
}
