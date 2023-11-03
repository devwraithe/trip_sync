import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/cubits/verify_auth_cubit/verify_auth_cubit.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:trip_sync/src/features/trips/presentation/cubits/new_trip_cubit/new_trip_cubit.dart';
import 'package:trip_sync/src/features/trips/presentation/cubits/trips_cubit/trips_cubit.dart';

import 'core/routing/route_screens.dart';
import 'core/theme/app_theme.dart';
import 'core/utilities/services/di_service.dart';
import 'core/utilities/ui_helpers.dart';
import 'features/authentication/presentation/cubits/verify_auth_cubit/verify_auth_state.dart';
import 'features/trips/presentation/screens/trips_screen.dart';

class TripSync extends StatelessWidget {
  const TripSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Authentication
        BlocProvider(create: (_) => sl<SignUpCubit>()),
        BlocProvider(create: (_) => sl<SignInCubit>()),
        BlocProvider(create: (_) => sl<ResetPasswordCubit>()),
        BlocProvider(create: (_) => sl<VerifyAuthCubit>()),

        // Trips
        BlocProvider(create: (_) => sl<NewTripCubit>()),
        BlocProvider(create: (_) => sl<TripsCubit>()),
      ],
      child: MaterialApp(
        title: "TripSync",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        home: BlocProvider(
          create: (context) => sl<VerifyAuthCubit>()..checkLoginStatus(),
          child: BlocBuilder<VerifyAuthCubit, VerifyAuthState>(
            builder: (context, state) {
              if (state is VerifyAuthLoading) {
                return Center(
                  child: UiHelpers.loader(),
                );
              } else if (state is Authenticated) {
                return const TripsScreen();
              } else if (state is Unauthenticated) {
                return const LoginScreen();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        routes: routesConfig,
      ),
    );
  }
}
