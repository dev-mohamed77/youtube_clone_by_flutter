// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:youtube_clone/core/services/network_services/network_service.dart';
import 'package:youtube_clone/features/video_player/data/model/message_result_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

import '../../../home/data/model/get_status_sbscriber.dart';

abstract class VideoPlayerRemoteDataSource {
  Future<VideoPlayerModel> getVideo(String videoId); //
  Future<MessageResultModel> addView(String videoId); //
  // likes and desLikes
  Future<MessageResultModel> addLikeForVideo();
  Future<MessageResultModel> addDesLikeForVideo();
  Future<MessageResultModel> deleteLikeForVideo();
  Future<MessageResultModel> deleteDesLikeForVideo();
  // comments
  Future<MessageResultModel> addComment();
  Future getCommentsByVideo(); //
  Future getCommentById();
  Future<MessageResultModel> deleteComment();
  Future updateComment();
  // subscriber
  Future<MessageResultModel> addSubscriber();
  Future<GetStatusSubscriber> getStatusSubscriberChannel(); //
  Future<MessageResultModel> addSubscriberAndUnSubscriber();
}

class VideoPlayerRemoteDataSourceImp implements VideoPlayerRemoteDataSource {
  final NetWorkService netWorkService;

  VideoPlayerRemoteDataSourceImp({
    required this.netWorkService,
  });
  @override
  Future<VideoPlayerModel> getVideo(String videoId) async {
    final response = await netWorkService.getData("/videos/$videoId");

    final model = VideoPlayerModel.fromMap(response.data);

    return model;
  }

  @override
  Future<MessageResultModel> addView(String videoId) async {
    final response =
        await netWorkService.updateData("/videos/add_view/$videoId");

    final model = MessageResultModel.fromMap(response.data);

    return model;
  }

  @override
  Future<MessageResultModel> addComment() {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> addDesLikeForVideo() {
    // TODO: implement addDesLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> addLikeForVideo() {
    // TODO: implement addLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> addSubscriber() {
    // TODO: implement addSubscriber
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> addSubscriberAndUnSubscriber() {
    // TODO: implement addSubscriberAndUnSubscriber
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> deleteComment() {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> deleteDesLikeForVideo() {
    // TODO: implement deleteDesLikeForVideo
    throw UnimplementedError();
  }

  @override
  Future<MessageResultModel> deleteLikeForVideo() {
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
  Future<GetStatusSubscriber> getStatusSubscriberChannel() async {
    final response =
        await netWorkService.getData("/subscribe/subscribe_status");

    final model = GetStatusSubscriber.fromMap(response.data);

    return model;
  }

  @override
  Future updateComment() {
    // TODO: implement updateComment
    throw UnimplementedError();
  }
}
