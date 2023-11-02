import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/register_screen.dart';

import 'core/theme/app_theme.dart';
import 'core/utilities/services/di_service.dart';

class TripSync extends StatelessWidget {
  const TripSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Authentication
        BlocProvider(create: (_) => sl<SignUpCubit>()),
      ],
      child: MaterialApp(
        title: "TripSync",
        debugShowCheckedModeBanner: false,
        home: const RegisterScreen(),
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
