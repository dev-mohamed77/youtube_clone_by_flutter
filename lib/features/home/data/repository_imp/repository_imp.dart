// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/home/data/datasource/home_remote_datasource.dart';
import 'package:youtube_clone/features/home/data/model/videos_model.dart';
import 'package:youtube_clone/features/home/data/model/video_with_message.dart';
import 'package:youtube_clone/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResult<VideoWithMessage>> addVideo({
    required File videoFile,
    required String title,
    required String description,
  }) async {
    try {
      final response = await remoteDataSource.addVideo(
        description: description,
        title: title,
        videoFile: videoFile,
      );

      return ApiResult.success(response);
    } catch (err) {
      print(err);
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<List<VideosDataModel>>> getVideosRandom({
    required int limit,
    required int page,
  }) async {
    try {
      final response = await remoteDataSource.getVideosRandom(
        limit: limit,
        page: page,
      );

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<List<VideosDataModel>>> getVideosSub() async {
    try {
      final response = await remoteDataSource.getVideosSub();

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<List<VideosDataModel>>> getVideosTrend({
    required int limit,
    required int page,
  }) async {
    try {
      final response = await remoteDataSource.getVideosTrend(
        limit: limit,
        page: page,
      );

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }
}
