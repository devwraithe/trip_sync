import 'package:flutter/material.dart';
import 'package:trip_sync/app/core/theme/app_text_theme.dart';

import '../widgets/trip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Text(
                "My Trips",
                style: AppTextTheme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return const Trip();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
