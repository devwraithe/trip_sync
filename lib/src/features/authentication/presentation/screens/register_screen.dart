import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/core/routing/routes.dart';
import 'package:trip_sync/src/core/theme/app_text_theme.dart';
import 'package:trip_sync/src/core/utilities/helpers/form_validator.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_up_cubit/sign_up_state.dart';

import '../../../../core/utilities/constants.dart';
import '../../../../core/utilities/ui_helpers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'register');

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
      BlocProvider.of<SignUpCubit>(context).signUp(data);
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
                "Create an account",
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
                  FilledButton(
                    onPressed: () => _submit(),
                    child: BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpError) {
                          UiHelpers.errorFlush(
                            state.message,
                            context,
                          );
                        }
                        if (state is SignUpSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.trips,
                            (_) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text("Sign up");
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
                        "Already have an account? ",
                        style: textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          Routes.signIn,
                        ),
                        child: Text(
                          "Login",
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
