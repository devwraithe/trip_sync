import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/core/theme/app_text_theme.dart';
import 'package:trip_sync/src/core/utilities/helpers/form_validator.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utilities/constants.dart';
import '../../../../core/utilities/ui_helpers.dart';
import '../cubits/sign_in_cubit/sign_in_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'login');

  final Map<String, dynamic> data = {
    "email": "",
    "password": "",
  };

  // Show and hide password
  bool _hidePassword = true;
  void _togglePassword() {
    setState(() => _hidePassword = !_hidePassword);
  }

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<SignInCubit>(context).signIn(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    const textTheme = AppTextTheme.textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 28,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Text(
                "Login",
                style: textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 6),
            Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email address",
                    ),
                    autovalidateMode: Constants.validateMode,
                    onSaved: (v) => data['email'] = v,
                    validator: (v) => FormValidator.email(v),
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: UiHelpers.switchPassword(
                        () => _togglePassword(),
                        _hidePassword,
                      ),
                    ),
                    autovalidateMode: Constants.validateMode,
                    onSaved: (v) => data['password'] = v,
                    obscureText: _hidePassword ? true : false,
                    validator: (v) => FormValidator.password(v),
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 26),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.resetPassword,
                    ),
                    child: Text(
                      "Forgot password?",
                      style: textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 26),
                  FilledButton(
                    onPressed: () => _submit(),
                    child: BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignInError) {
                          UiHelpers.errorFlush(
                            state.message,
                            context,
                          );
                        }
                        if (state is SignInSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.trips,
                            (_) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignInLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text("Sign in");
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Routes.signUp,
                        ),
                        child: Text(
                          "Create one",
                          style: textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
