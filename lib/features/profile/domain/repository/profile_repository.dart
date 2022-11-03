import 'package:youtube_clone/core/services/network_services/api_result.dart';
import 'package:youtube_clone/features/profile/data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileModel>> getProfile(String id);
}
