import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_sync/src/core/utilities/constants.dart';
import 'package:trip_sync/src/core/utilities/errors/exceptions.dart';
import 'package:trip_sync/src/core/utilities/errors/failure.dart';

import '../domain/trips_repository.dart';

class TripsRepositoryImpl implements TripsRepository {
  @override
  Future<Either<Failure, void>> newTrip(Map<String, dynamic> data) async {
    final tripsCol = Constants.firestore.collection("trips");

    try {
      final newTrip = tripsCol.doc();
      final newTripId = newTrip.id;

      await tripsCol.add({
        'id': newTripId,
        'user': Constants.user!.uid,
        'name': data['name'],
        'reason': data['reason'],
      }).then((value) {
        debugPrint("New trip added: $value");
      }).catchError((err) {
        debugPrint("Error adding trip: $err");
      });

      return const Right(null);
    } on ConnectionException catch (_) {
      return Left(Failure(Constants.socketError));
    } on TimeoutException catch (_) {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      print("error: $e");
      return Left(Failure(Constants.unknownError));
    }
  }
}
