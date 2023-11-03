import 'package:flutter/material.dart';
import 'package:trip_sync/src/core/routing/routes.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 28,
          ),
          child: Column(
            children: [
              FilledButton(
                onPressed: () => Navigator.pushNamed(context, Routes.newTrip),
                child: const Text("New trip"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
