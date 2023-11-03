import 'package:flutter/material.dart';
import 'package:trip_sync/src/core/routing/routes.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:trip_sync/src/features/authentication/presentation/screens/register_screen.dart';
import 'package:trip_sync/src/features/trips/presentation/screens/trips_screen.dart';

import '../../features/authentication/presentation/screens/reset_password_screen.dart';
import '../../features/trips/presentation/screens/new_trip_screen.dart';

final routesConfig = <String, WidgetBuilder>{
  // Auth route screens
  Routes.signUp: (context) => const RegisterScreen(),
  Routes.signIn: (context) => const LoginScreen(),
  Routes.resetPassword: (context) => const ResetPasswordScreen(),

  // Trip route screens
  Routes.trips: (context) => const TripsScreen(),
  Routes.newTrip: (context) => const NewTripScreen(),
};
