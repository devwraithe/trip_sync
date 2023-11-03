import '../../../features/trips/data/trips_repository_impl.dart';
import '../../../features/trips/domain/trips_repository.dart';
import '../../../features/trips/domain/usecases/new_trip_usecase.dart';
import '../../../features/trips/domain/usecases/trips_usecase.dart';
import '../../../features/trips/presentation/cubits/new_trip_cubit/new_trip_cubit.dart';
import '../../../features/trips/presentation/cubits/trips_cubit/trips_cubit.dart';
import '../services/di_service.dart';

void newTripInjector() {
  regSingleton(() => NewTripCubit(sl()));
  regSingleton(() => NewTripUsecase(sl()));
}

void allTripsInjector() {
  regSingleton(() => TripsCubit(sl()));
  regSingleton(() => TripsUsecase(sl()));
}

// Core injector for repo
void tripsInjector() {
  regSingleton<TripsRepository>(() => TripsRepositoryImpl());
}
