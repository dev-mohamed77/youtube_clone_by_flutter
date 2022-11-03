import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/utils/manager/app_navigator_manager.dart';
import 'package:youtube_clone/features/profile/presentation/pages/profile_screen_large.dart';
import 'package:youtube_clone/features/profile/presentation/pages/profile_screen_small.dart';
import 'package:youtube_clone/getit_injection.dart';

import '../../data/model/profile_model.dart';
import '../../domain/repository/profile_repository.dart';
import '../blocs/profile_bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.profileModel});

  static const String id = "ProfileScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        const ProfileScreen(),
      );
  final ProfileModel? profileModel;
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: ProfileScreenLarge(),
      mobile: ProfileScreenSmall(),
    );
  }
}
