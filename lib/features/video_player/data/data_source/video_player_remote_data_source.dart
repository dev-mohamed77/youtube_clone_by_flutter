// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:youtube_clone/core/services/network_services/network_service.dart';
import 'package:youtube_clone/features/video_player/data/model/comments_model.dart';
import 'package:youtube_clone/features/video_player/data/model/likes_and_deslikes_model.dart';
import 'package:youtube_clone/features/video_player/data/model/message_model.dart';
import 'package:youtube_clone/features/video_player/data/model/video_player_model.dart';

import '../../../../getit_injection.dart';
import '../../../auth/data/datasource/auth_local_database.dart';
import '../model/add_comment_model.dart';
import '../model/result_and_message_model.dart';

abstract class VideoPlayerRemoteDataSource {
  Future<VideoPlayerModel> getVideo(String videoId); //
  Future<MessageModel> addView(String videoId); //
  // likes and desLikes

  Future<LikesAndDesLikesModel> addLikeAndDeleteForVideo(String videoID);
  Future<LikesAndDesLikesModel> addDesLikeAndDeleteForVideo(String videoID);
  // comments
  Future<AddCommentModel> addComment(String videoID, String title);
  Future<List<CommentModel>> getCommentsByVideo({
    required String videoID,
    required String pages,
    required String limit,
  }); //
  Future<CommentModel> getCommentById(String commentID);
  Future<MessageModel> deleteComment(String commentID);
  Future<MessageModel> updateComment(String commentID, String title);
  // subscriber
  Future<ResultAndMessageModel> addSubscribe(String userID);
  Future<ResultAndMessageModel> unSubscribe(String userID);
  Future<ResultAndMessageModel> getStatusSubscriberChannel(String userID); //
}

class VideoPlayerRemoteDataSourceImp implements VideoPlayerRemoteDataSource {
  final NetWorkService netWorkService;

  VideoPlayerRemoteDataSourceImp({
    required this.netWorkService,
  });
  @override
  Future<VideoPlayerModel> getVideo(String videoId) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();
    final VideoPlayerModel model;

    if (currentUser != null) {
      final response =
          await netWorkService.getData("/videos/$videoId", queryParams: {
        "user_id": currentUser["id"],
      });

      model = VideoPlayerModel.fromMap(response.data);
    } else {
      final response =
          await netWorkService.getData("/videos/$videoId", queryParams: {});

      model = VideoPlayerModel.fromMap(response.data);
    }
    return model;
  }

  // Subscribe
  @override
  Future<MessageModel> addView(String videoId) async {
    final response =
        await netWorkService.updateData("/videos/add_view/$videoId");

    final model = MessageModel.fromMap(response.data);

    return model;
  }

  @override
  Future<ResultAndMessageModel> getStatusSubscriberChannel(
      String userID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();

    final ResultAndMessageModel model;

    if (currentUser != null) {
      final response = await netWorkService.getData(
        "/subscribe/subscribe_status/$userID",
        token: "Bearer ${currentUser["token"]}",
      );

      model = ResultAndMessageModel.fromMap(response.data);
    } else {
      model = const ResultAndMessageModel(
        status: false,
        result: false,
        message: 'not auth',
      );
    }

    return model;
  }

  @override
  Future<ResultAndMessageModel> addSubscribe(String userID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();

    final ResultAndMessageModel model;

    if (currentUser != null) {
      final response = await netWorkService.postData(
        "/subscribe/",
        data: {
          "user_to": userID,
        },
        token: "Bearer ${currentUser["token"]}",
      );

      model = ResultAndMessageModel.fromMap(response.data);
    } else {
      model = const ResultAndMessageModel(
        status: false,
        result: false,
        message: 'not auth',
      );
    }

    return model;
  }

  @override
  Future<ResultAndMessageModel> unSubscribe(String userID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();

    final ResultAndMessageModel model;

    if (currentUser != null) {
      final response = await netWorkService.deleteData(
        "/subscribe/",
        data: {
          "user_to": userID,
        },
        token: "Bearer ${currentUser["token"]}",
      );

      model = ResultAndMessageModel.fromMap(response.data);
    } else {
      model = const ResultAndMessageModel(
        status: false,
        result: false,
        message: 'not auth',
      );
    }

    return model;
  }

  // Comments
  @override
  Future<AddCommentModel> addComment(String videoID, String title) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();

    final response = await netWorkService.postData(
      "/comments",
      data: {
        "video_id": videoID,
        "title": title,
      },
      token: "Bearer ${currentUser["token"]}",
    );

    final dynamic data = response.data["result"];

    final AddCommentModel model = AddCommentModel.fromMap(data);

    return model;
  }

  @override
  Future<MessageModel> deleteComment(String commentID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();
    final MessageModel model;
    if (currentUser != null) {
      final response = await netWorkService.deleteData(
        "/comments/$commentID",
        token: "Bearer ${currentUser["token"]}",
      );
      model = MessageModel.fromMap(response.data);
    } else {
      model = const MessageModel(status: false, result: "Not Auth");
    }
    return model;
  }

  @override
  Future<CommentModel> getCommentById(String commentID) async {
    final response = await netWorkService.getData("/comments/$commentID");

    final model = CommentModel.fromMap(response.data);

    return model;
  }

  @override
  Future<List<CommentModel>> getCommentsByVideo({
    required String videoID,
    required String pages,
    required String limit,
  }) async {
    final response = await netWorkService.getData(
      "/comments/all/$videoID",
      queryParams: {
        "pages": pages,
        "limit": limit,
      },
    );

    Iterable data = response.data["result"];

    final List<CommentModel> result = data.map((comment) {
      return CommentModel.fromMap(comment);
    }).toList();

    return result;
  }

  @override
  Future<MessageModel> updateComment(String commentID, String title) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();
    final MessageModel model;
    if (currentUser != null) {
      final response = await netWorkService.updateData(
        "/comments/$commentID",
        data: {
          "title": title,
        },
        token: "Bearer ${currentUser["token"]}",
      );
      model = MessageModel.fromMap(response.data);
    } else {
      model = const MessageModel(status: false, result: "Not Auth");
    }

    return model;
  }

  // Likes

  @override
  Future<LikesAndDesLikesModel> addLikeAndDeleteForVideo(String videoID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();
    final LikesAndDesLikesModel model;
    if (currentUser != null) {
      final response = await netWorkService.postData(
        "/likes",
        data: {"video_id": videoID},
        token: "Bearer ${currentUser["token"]}",
      );

      model = LikesAndDesLikesModel.fromMap(response.data);
    } else {
      model = const LikesAndDesLikesModel(
        status: false,
        result: LikesAndDesLikesDataModel(like: false, desLike: false),
        message: "Not Auth",
      );
    }

    return model;
  }

  @override
  Future<LikesAndDesLikesModel> addDesLikeAndDeleteForVideo(
      String videoID) async {
    final currentUser = await getIt<AuthLocalDataSource>().getUser();
    final LikesAndDesLikesModel model;
    if (currentUser != null) {
      final response = await netWorkService.postData(
        "/deslikes",
        data: {"video_id": videoID},
        token: "Bearer ${currentUser["token"]}",
      );

      model = LikesAndDesLikesModel.fromMap(response.data);
    } else {
      model = const LikesAndDesLikesModel(
        status: false,
        result: LikesAndDesLikesDataModel(like: false, desLike: false),
        message: "Not Auth",
      );
    }
    return model;
  }
}
