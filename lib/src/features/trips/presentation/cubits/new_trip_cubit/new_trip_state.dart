import 'package:equatable/equatable.dart';

abstract class NewTripState extends Equatable {
  const NewTripState();
  @override
  List<Object> get props => [];
}

class NewTripInitial extends NewTripState {}

class NewTripLoading extends NewTripState {}

class NewTripSuccess extends NewTripState {}

class NewTripError extends NewTripState {
  final String message;
  const NewTripError(this.message);

  @override
  List<Object> get props => [message];
}
