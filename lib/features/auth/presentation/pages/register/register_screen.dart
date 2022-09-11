import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/features/auth/presentation/pages/register/register_screen_large.dart';
import 'package:youtube_clone/features/auth/presentation/pages/register/register_screen_small.dart';
import 'package:youtube_clone/getit_injection.dart';

import '../../../../../core/utils/manager/app_navigator_manager.dart';
import '../../../domain/repository/repository.dart';
import '../../manager/auth_bloc/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const String id = "/RegisterScreen";

  static Route route() => AppNavigatorManager.navigatorMaterialPush(
        id,
        BlocProvider(
          create: (context) => AuthBloc(repo: getIt<AuthRepository>()),
          child: const RegisterScreen(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Responsive(
          mobile: RegisterScreenSmall(),
          desktop: RegisterScreenLarge(),
        ),
      ),
    );
  }
}
