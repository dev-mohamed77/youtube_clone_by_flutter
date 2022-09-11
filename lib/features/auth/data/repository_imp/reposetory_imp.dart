import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/core/services/network_services/error_handle.dart';
import 'package:youtube_clone/features/auth/data/datasource/auth_local_database.dart';
import 'package:youtube_clone/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:youtube_clone/features/auth/data/model/register_model.dart';
import 'package:youtube_clone/features/auth/domain/repository/repository.dart';

import '../model/user_model.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<ApiResult<User>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        username: username,
        password: password,
      );

      await localDataSource.addUser(response.user!);

      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(ErrorHandle.getDioException(err));
    }
  }

  @override
  Future<ApiResult<RegisterModel>> register({
    required String fullname,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      var response = await remoteDataSource.register(
        fullname: fullname,
        username: username,
        email: email,
        password: password,
      );
      return ApiResult.success(response);
    } catch (err) {
      return ApiResult.failure(
        ErrorHandle.getDioException(err),
      );
    }
  }
}
