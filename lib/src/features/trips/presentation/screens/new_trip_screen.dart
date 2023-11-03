import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/features/trips/presentation/cubits/new_trip_cubit/new_trip_cubit.dart';

import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utilities/constants.dart';
import '../../../../core/utilities/helpers/form_validator.dart';
import '../../../../core/utilities/ui_helpers.dart';
import '../cubits/new_trip_cubit/new_trip_state.dart';

class NewTripScreen extends StatefulWidget {
  const NewTripScreen({super.key});

  @override
  State<NewTripScreen> createState() => _NewTripScreenState();
}

class _NewTripScreenState extends State<NewTripScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'new-trip');

  final Map<String, dynamic> data = {
    "name": "",
    "reason": "",
  };

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<NewTripCubit>(context).newTrip(data);
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
                "New trip",
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
                      hintText: "Trip name",
                    ),
                    autovalidateMode: Constants.validateMode,
                    onSaved: (v) => data['name'] = v,
                    validator: (v) => FormValidator.others(v),
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Trip reason",
                    ),
                    autovalidateMode: Constants.validateMode,
                    onSaved: (v) => data['reason'] = v,
                    validator: (v) => FormValidator.others(v),
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Trip start date",
                    ),
                    autovalidateMode: Constants.validateMode,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Trip end date",
                    ),
                    autovalidateMode: Constants.validateMode,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 26),
                  FilledButton(
                    onPressed: () => _submit(),
                    child: BlocConsumer<NewTripCubit, NewTripState>(
                      listener: (context, state) {
                        if (state is NewTripError) {
                          UiHelpers.errorFlush(
                            state.message,
                            context,
                          );
                        }
                        if (state is NewTripSuccess) {
                          debugPrint("Whatever");
                        }
                      },
                      builder: (context, state) {
                        if (state is NewTripLoading) {
                          return const CircularProgressIndicator();
                        } else {
                          return const Text("Add trip");
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
