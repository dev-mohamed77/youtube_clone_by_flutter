// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_clone/core/components/appbar_custom.dart';
import 'package:youtube_clone/core/components/error/error_screen.dart';
import 'package:youtube_clone/core/components/loading_custom.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_cover.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/profile_information.dart';
import 'package:youtube_clone/features/profile/presentation/pages/widgets/tabbar_custom.dart';
import '../blocs/profile_bloc/profile_bloc.dart';
import '../blocs/profile_bloc/profile_state.dart';

class ProfileScreenLarge extends StatelessWidget {
  const ProfileScreenLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is GetProfileStateLoading) {
              return const LoadingCustom();
            } else if (state is GetProfileStateSuccess) {
              return Column(
                children: [
                  ProfileCover(
                    text: state.data.result.user.fullname.substring(0, 1),
                  ),
                  ProfileInformation(profile: state.data),
                  TabBarCustom(profile: state.data),
                ],
              );
            } else if (state is GetProfileStateError) {
              return ErrorScreen(
                title: state.error,
                description: state.error,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
