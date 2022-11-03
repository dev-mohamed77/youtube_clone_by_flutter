// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/video_player/data/model/add_comment_model.dart';
import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';
import 'package:youtube_clone/features/video_player/data/model/result_and_message_model.dart';
import 'package:youtube_clone/features/video_player/data/data_source/video_player_remote_data_source.dart';
import 'package:youtube_clone/features/video_player/data/model/message_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

import '../../domain/repository/video_player_repository.dart';
import '../model/likes_and_deslikes_model.dart';

class VideoPlayerRepositoryImp implements VideoPlayerRepository {
  final VideoPlayerRemoteDataSource remoteDataSource;

  const VideoPlayerRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResult<VideoPlayerModel>> getVideo(String videoId) async {
    try {
      final response = await remoteDataSource.getVideo(videoId);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<MessageModel>> addView(String videoId) async {
    try {
      final response = await remoteDataSource.addView(videoId);

      return ApiResult.success(response);
    } catch (err) {
      if (err is DioError) {
        print("err => ${err.response?.data}");
      }

      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<ResultAndMessageModel>> getStatusSubscriberChannel(
      String userID) async {
    try {
      final response =
          await remoteDataSource.getStatusSubscriberChannel(userID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<ResultAndMessageModel>> addSubscribe(String userID) async {
    try {
      final response = await remoteDataSource.addSubscribe(userID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<ResultAndMessageModel>> unSubscribe(String userID) async {
    try {
      final response = await remoteDataSource.unSubscribe(userID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<AddCommentModel>> addComment(
      String videoID, String title) async {
    try {
      final response = await remoteDataSource.addComment(videoID, title);

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<LikesAndDesLikesModel>> addDesLikeAndDeleteForVideo(
    String videoID,
  ) async {
    try {
      final response =
          await remoteDataSource.addDesLikeAndDeleteForVideo(videoID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<LikesAndDesLikesModel>> addLikeAndDeleteForVideo(
    String videoID,
  ) async {
    try {
      final response = await remoteDataSource.addLikeAndDeleteForVideo(videoID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<MessageModel>> deleteComment(String commentID) async {
    try {
      final response = await remoteDataSource.deleteComment(commentID);
      return ApiResult.success(response);
    } catch (err) {
      if (err is DioError) {
        print(err.response);
      }
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<CommentModel>> getCommentById(String commentID) async {
    try {
      final response = await remoteDataSource.getCommentById(commentID);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<List<CommentModel>>> getCommentsByVideo({
    required String videoID,
    required String pages,
    required String limit,
  }) async {
    try {
      final response = await remoteDataSource.getCommentsByVideo(
        videoID: videoID,
        pages: pages,
        limit: limit,
      );
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<MessageModel>> updateComment(
    String commentID,
    String title,
  ) async {
    try {
      final response = await remoteDataSource.updateComment(commentID, title);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }
}
