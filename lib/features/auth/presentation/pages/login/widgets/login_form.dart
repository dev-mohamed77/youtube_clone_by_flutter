import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_clone/core/components/responsive.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';
import 'package:youtube_clone/features/auth/presentation/pages/widgets/social_button.dart';
import 'package:youtube_clone/features/home/presentation/pages/home_screen.dart';
import '../../../../../../../core/components/button_custom.dart';
import '../../../../../../../core/components/text_form_field_custom.dart';
import '../../../../../../../core/utils/config/strings_config.dart';
import '../../../manager/auth_bloc/auth_bloc.dart';
import '../../../manager/auth_bloc/auth_state.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginStateSuccess) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        }
      },
      builder: (context, state) {
        if (state is LoginStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoginStateSuccess) {
          return Text("completed ${state.user.user}");
        } else if (state is LoginStateFailure) {
          return Text(state.message.toString());
        }

        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFieldCustom(
                hintText: StringsConfig.username,
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                hintText: StringsConfig.password,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required";
                  }
                  return null;
                },
                isSuffix: true,
                obscure: true,
                suffix: IconButton(
                  icon: const Icon(
                    Icons.visibility_off_outlined,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonCustom(
                text: StringsConfig.login,
                width: Responsive.isDesktop(context) ? 110 : size.width / 1.11,
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(LoginEvent(
                          username: usernameController.text,
                          password: passwordController.text,
                        ));
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SocialButton(
                      onClick: () {},
                      icon: FontAwesomeIcons.facebook,
                      iconColor: AppColorManager.blueColor,
                      iconSize: Responsive.isMobile(context)
                          ? size.width * 0.059
                          : null,
                    ),
                    SocialButton(
                      onClick: () {},
                      icon: FontAwesomeIcons.apple,
                      iconColor: AppColorManager.blackColor,
                      iconSize: Responsive.isMobile(context)
                          ? size.width * 0.059
                          : null,
                    ),
                    SocialButton(
                      onClick: () async {},
                      icon: FontAwesomeIcons.google,
                      iconColor: AppColorManager.red,
                      iconSize: Responsive.isMobile(context)
                          ? size.width * 0.059
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    StringsConfig.notMember,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      StringsConfig.register,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
