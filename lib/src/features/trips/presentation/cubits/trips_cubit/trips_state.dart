import 'package:equatable/equatable.dart';

import '../../../domain/trip_entity.dart';

abstract class TripsState extends Equatable {
  const TripsState();
  @override
  List<Object> get props => [];
}

class TripsInitial extends TripsState {}

class TripsLoading extends TripsState {}

class TripsSuccess extends TripsState {
  final List<TripEntity> result;
  const TripsSuccess(this.result);

  @override
  List<Object> get props => [result];
}

class TripsError extends TripsState {
  final String message;
  const TripsError(this.message);

  @override
  List<Object> get props => [message];
}
