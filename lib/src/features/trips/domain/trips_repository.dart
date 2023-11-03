import 'package:dartz/dartz.dart';

import '../../../core/utilities/errors/failure.dart';

abstract class TripsRepository {
  Future<Either<Failure, void>> newTrip(Map<String, dynamic> data);
}
