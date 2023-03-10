import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/models/user_edit_form_model.dart';
import 'package:bank/shared/shared_methods.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:bank/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  // bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              //? animasi loading
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 100),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: background2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      title: 'Fullname',
                      controller: nameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                        title: 'Password',
                        controller: passwordController,
                        obscureText: true),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: 'Update',
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(AuthUpdateUser(UserEditFormModel(
                              username: usernameController.text,
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            )));
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
