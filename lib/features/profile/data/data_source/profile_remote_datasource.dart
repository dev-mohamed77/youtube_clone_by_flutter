// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:youtube_clone/features/profile/data/model/profile_model.dart';

import '../../../../core/services/network_services/network_service.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileByID(String id);
}

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final NetWorkService netWorkService;
  ProfileRemoteDataSourceImp({
    required this.netWorkService,
  });
  @override
  Future<ProfileModel> getProfileByID(String id) async {
    final response = await netWorkService.getData("/users/$id");

    final model = ProfileModel.fromMap(response.data);

    return model;
  }
}
