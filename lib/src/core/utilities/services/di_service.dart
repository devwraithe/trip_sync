import 'package:get_it/get_it.dart';
import 'package:trip_sync/src/core/utilities/injectors/trips_injector.dart';

import '../injectors/auth_injector.dart';

final sl = GetIt.instance;

regFactory<T extends Object>(T Function() factFunc) {
  sl.registerFactory(factFunc);
}

regSingleton<T extends Object>(T Function() factFunc) {
  sl.registerLazySingleton(factFunc);
}

void init() {
  // Auth injectors
  signUpInjector();
  signInInjector();
  resetPasswordInjector();
  verifyAuthInjector();

  // Trips injectors
  newTripInjector();

  // Repo injectors
  authInjector();
  tripsInjector();
}
