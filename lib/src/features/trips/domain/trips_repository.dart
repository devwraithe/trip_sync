import 'package:dartz/dartz.dart';
import 'package:trip_sync/src/features/trips/domain/trip_entity.dart';

import '../../../core/utilities/errors/failure.dart';

abstract class TripsRepository {
  Future<Either<Failure, void>> newTrip(Map<String, dynamic> data);
  Future<Either<Failure, List<TripEntity>>> getTrips();
}
