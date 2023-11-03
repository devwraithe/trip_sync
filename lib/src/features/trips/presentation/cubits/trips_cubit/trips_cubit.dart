import 'package:flutter_bloc/flutter_bloc.dart';

import './trips_state.dart';
import '../../../domain/usecases/trips_usecase.dart';

class TripsCubit extends Cubit<TripsState> {
  final TripsUsecase _usecase;

  TripsCubit(this._usecase) : super(TripsInitial());

  Future<void> getTrips() async {
    emit(TripsLoading());
    try {
      final result = await _usecase.execute();
      emit(
        result.fold(
          (failure) => TripsError(failure.message),
          (result) => TripsSuccess(result),
        ),
      );
    } catch (error) {
      emit(
        TripsError(
          error.toString(),
        ),
      );
    }
  }
}
