import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/core/routing/routes.dart';
import 'package:trip_sync/src/core/utilities/ui_helpers.dart';
import 'package:trip_sync/src/features/trips/presentation/cubits/trips_cubit/trips_cubit.dart';
import 'package:trip_sync/src/features/trips/presentation/cubits/trips_cubit/trips_state.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TripsCubit>(context).getTrips();
  }

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
              BlocBuilder<TripsCubit, TripsState>(
                builder: (context, state) {
                  if (state is TripsLoading) {
                    return UiHelpers.loader();
                  } else if (state is TripsError) {
                    return Text(state.message);
                  } else if (state is TripsSuccess) {
                    return Text(state.result[0].name.toString());
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
