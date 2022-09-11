import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/features/auth/data/model/user_model.dart';
import 'package:youtube_clone/features/auth/data/model/register_model.dart';

abstract class AuthRepository {
  Future<ApiResult<User>> login({
    required String username,
    required String password,
  });
  Future<ApiResult<RegisterModel>> register({
    required String fullname,
    required String username,
    required String email,
    required String password,
  });
}
