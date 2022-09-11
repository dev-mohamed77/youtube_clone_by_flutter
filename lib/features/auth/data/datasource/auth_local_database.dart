import 'package:hive/hive.dart';

import '../model/user_model.dart';

abstract class AuthLocalDataSource {
  Future? getUser();
  Future<void> addUser(UserData user);
}

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  late Box userBox;

  AuthLocalDataSourceImp._() {
    _hiveInstance();
  }

  _hiveInstance() async {
    userBox = await Hive.openBox("currentUser");
  }

  factory AuthLocalDataSourceImp() => AuthLocalDataSourceImp._();

  final String _userKey = "user";

  @override
  Future<void> addUser(UserData user) async {
    var result = userBox.put(_userKey, user.toMap());
    return result;
  }

  @override
  Future? getUser() async {
    userBox = await Hive.openBox("currentUser");
    final userModel = userBox.get(_userKey);

    if (userModel == null) {
      return Future.value(null);
    } else {
      return Future.value(userModel);
    }
  }
}
