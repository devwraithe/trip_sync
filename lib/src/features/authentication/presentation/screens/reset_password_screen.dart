import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/core/theme/app_text_theme.dart';

import '../../../../core/utilities/constants.dart';
import '../../../../core/utilities/helpers/form_validator.dart';
import '../../../../core/utilities/ui_helpers.dart';
import '../cubits/reset_password_cubit/reset_password_cubit.dart';
import '../cubits/reset_password_cubit/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'reset-password');
  final TextEditingController _emailController = TextEditingController();

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<ResetPasswordCubit>(context).resetPassword(
        _emailController.text,
      );
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
                "Reset Password",
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
                    onSaved: (v) => _emailController.text = v!,
                    validator: (v) => FormValidator.email(v),
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 26),
                  FilledButton(
                    onPressed: () => _submit(),
                    child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                      listener: (context, state) {
                        if (state is ResetPasswordError) {
                          UiHelpers.errorFlush(
                            state.message,
                            context,
                          );
                        }
                        if (state is ResetPasswordSuccess) {
                          UiHelpers.successFlush(
                            "Check your email for reset link",
                            context,
                          );
                          // Future.delayed(
                          //   const Duration(seconds: 3),
                          //   () => Navigator.pushNamed(
                          //     context,
                          //     Routes.signIn,
                          //   ),
                          // );
                        }
                      },
                      builder: (context, state) {
                        if (state is ResetPasswordLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text("Reset Password");
                        }
                      },
                    ),
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
