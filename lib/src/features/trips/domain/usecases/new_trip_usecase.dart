import 'package:dartz/dartz.dart';
import 'package:trip_sync/src/core/utilities/errors/failure.dart';

import '../trips_repository.dart';

class NewTripUsecase {
  final TripsRepository _repo;
  NewTripUsecase(this._repo);

  Future<Either<Failure, void>> execute(Map<String, dynamic> data) async {
    final response = await _repo.newTrip(data);
    return response.fold(
      (failure) => Left(failure),
      (user) => const Right(null),
    );
  }
}
