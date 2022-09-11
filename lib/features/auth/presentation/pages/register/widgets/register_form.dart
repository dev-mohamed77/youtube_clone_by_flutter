import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/core/components/text_form_field_custom.dart';
import 'package:youtube_clone/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';

import '../../../../../../core/components/button_custom.dart';
import '../../../../../../core/components/responsive.dart';
import '../../../../../../core/utils/config/strings_config.dart';
import '../../../manager/auth_bloc/auth_state.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is RegisterStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RegisterStateSuccess) {
          return Center(
            child: Text(state.data.result),
          );
        } else if (state is RegisterStateFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFieldCustom(
                hintText: StringsConfig.fullname,
                controller: _fullnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Fullname required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                hintText: StringsConfig.username,
                controller: _usernameController,
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
                hintText: StringsConfig.email,
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldCustom(
                hintText: StringsConfig.password,
                controller: _passwordController,
                isSuffix: true,
                obscure: true,
                suffix: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off_rounded,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonCustom(
                text: StringsConfig.register,
                width: Responsive.isDesktop(context) ? 110 : size.width / 1.11,
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          RegisterEvent(
                            fullname: _fullnameController.text,
                            username: _usernameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  }
                },
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
