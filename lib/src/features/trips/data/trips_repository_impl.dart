import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_sync/src/core/utilities/constants.dart';
import 'package:trip_sync/src/core/utilities/errors/exceptions.dart';
import 'package:trip_sync/src/core/utilities/errors/failure.dart';
import 'package:trip_sync/src/features/trips/data/trip_model.dart';
import 'package:trip_sync/src/features/trips/domain/trip_entity.dart';

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
      return Left(Failure(Constants.unknownError));
    }
  }

  @override
  Future<Either<Failure, List<TripEntity>>> getTrips() async {
    try {
      final user = Constants.firebaseAuth.currentUser;
      final querySnapshot = await Constants.firestore
          .collection('trips')
          .where('user', isEqualTo: user!.uid)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final tripsList = querySnapshot.docs.map((trip) {
          return TripModel.fromSnapshot(trip);
        }).toList();
        final trips = tripsList.map((e) => e.toEntity()).toList();
        return Right(trips);
      } else {
        return Left(Failure(Constants.noTrips));
      }
    } on SocketException catch (_) {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.toString());
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
