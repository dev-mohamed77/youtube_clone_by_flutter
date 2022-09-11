// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:youtube_clone/core/services/network_services/network_service.dart';
import 'package:youtube_clone/features/auth/data/model/register_model.dart';

import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> login({
    required String username,
    required String password,
  });
  Future<RegisterModel> register({
    required String fullname,
    required String username,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final NetWorkService netWorkService;

  AuthRemoteDataSourceImp(this.netWorkService);
  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {
    final response = await netWorkService.postData(
      "/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    final model = User.fromJson(response.data);
    return model;
  }

  @override
  Future<RegisterModel> register({
    required String fullname,
    required String username,
    required String email,
    required String password,
  }) async {
    var response = await netWorkService.postData("/auth/register", data: {
      "fullname": fullname,
      "username": username,
      "email": email,
      "password": password,
    });

    final model = RegisterModel.fromMap(response.data);
    return model;
  }
}
