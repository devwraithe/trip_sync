import 'package:flutter_bloc/flutter_bloc.dart';

import './new_trip_state.dart';
import '../../../domain/usecases/new_trip_usecase.dart';

class NewTripCubit extends Cubit<NewTripState> {
  final NewTripUsecase _usecase;

  NewTripCubit(this._usecase) : super(NewTripInitial());

  Future<void> newTrip(Map<String, dynamic> data) async {
    emit(NewTripLoading());
    try {
      final result = await _usecase.execute(data);
      emit(
        result.fold(
          (failure) => NewTripError(failure.message),
          (n) => NewTripSuccess(),
        ),
      );
    } catch (error) {
      emit(
        NewTripError(
          error.toString(),
        ),
      );
    }
  }
}
