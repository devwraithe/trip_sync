import 'package:dartz/dartz.dart';
import 'package:trip_sync/src/core/utilities/errors/failure.dart';
import 'package:trip_sync/src/features/trips/domain/trip_entity.dart';

import '../trips_repository.dart';

class TripsUsecase {
  final TripsRepository _repo;
  TripsUsecase(this._repo);

  Future<Either<Failure, List<TripEntity>>> execute() async {
    final response = await _repo.getTrips();
    return response.fold(
      (failure) => Left(failure),
      (user) => Right(user),
    );
  }
}
