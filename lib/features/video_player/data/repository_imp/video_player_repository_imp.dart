// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/home/data/model/get_status_sbscriber.dart';
import 'package:youtube_clone/features/video_player/data/data_source/video_player_remote_data_source.dart';
import 'package:youtube_clone/features/video_player/data/model/message_result_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

import '../../domain/repository/video_player_repository.dart';

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
  Future<ApiResult<MessageResultModel>> addView(String videoId) async {
    try {
      final response = await remoteDataSource.addView(videoId);

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<MessageResultModel>> addComment() {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> addDesLikeForVideo() {
    // TODO: implement addDesLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> addLikeForVideo() {
    // TODO: implement addLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> addSubscriber() {
    // TODO: implement addSubscriber
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> addSubscriberAndUnSubscriber() {
    // TODO: implement addSubscriberAndUnSubscriber
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> deleteComment() {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> deleteDesLikeForVideo() {
    // TODO: implement deleteDesLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<MessageResultModel>> deleteLikeForVideo() {
    // TODO: implement deleteLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future getCommentById() {
    // TODO: implement getCommentById
    throw UnimplementedError();
  }

  @override
  Future getCommentsByVideo() {
    // TODO: implement getCommentsByVideo
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<GetStatusSubscriber>> getStatusSubscriberChannel() async {
    try {
      final response = await remoteDataSource.getStatusSubscriberChannel();

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future updateComment() {
    // TODO: implement updateComment
    throw UnimplementedError();
  }
}
