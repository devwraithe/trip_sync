import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/utilities/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> signUp(Map<String, dynamic> data);
  Future<Either<Failure, void>> signIn(Map<String, dynamic> data);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<void> logout();
  Future<bool> verifyAuth();
}
