// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/profile/data/data_source/profile_remote_datasource.dart';
import 'package:youtube_clone/features/profile/data/model/profile_model.dart';
import 'package:youtube_clone/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImp extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  ProfileRepositoryImp({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResult<ProfileModel>> getProfile(String id) async {
    try {
      final response = await remoteDataSource.getProfileByID(id);
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }
}
