import 'package:flutter/material.dart';
import 'package:trip_sync/app/core/theme/app_theme.dart';
import 'package:trip_sync/app/presentation/screens/home_screen.dart';

class TripSync extends StatelessWidget {
  const TripSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trip Sync",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
