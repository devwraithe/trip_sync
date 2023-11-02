import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trip_sync/src/app.dart';

import 'firebase_options.dart';
import 'src/core/utilities/services/di_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();

  runApp(const TripSync());
}
