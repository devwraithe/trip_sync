import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final User? result;
  const SignUpSuccess(this.result);

  @override
  List<Object> get props => [result!];
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError(this.message);

  @override
  List<Object> get props => [message];
}
