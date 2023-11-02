import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utilities/constants.dart';
import '../../../core/utilities/errors/exceptions.dart';
import '../../../core/utilities/errors/failure.dart';
import '../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;

  const AuthRepositoryImpl(this._auth);

  @override
  Future<Either<Failure, User?>> signUp(
    Map<String, dynamic> data,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Left(Failure("Account already exists for this email"));
      } else if (e.code == 'weak-password') {
        return Left(Failure("Password must be more than 6 characters"));
      } else if (e.code == 'invalid-email') {
        return Left(Failure("An invalid email address was provided"));
      } else if (e.code == "network-request-failed") {
        return Left(Failure(Constants.socketError));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on ConnectionException {
      return Left(Failure(Constants.socketError));
    } on TimeoutException {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      return Left(Failure(Constants.unknownError));
    }
  }

  @override
  Future<Either<Failure, void>> signIn(Map<String, dynamic> data) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      debugPrint("Login auth exception: ${e.code}");
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        return Left(Failure("Login credentials is invalid"));
      } else if (e.code == "network-request-failed") {
        return Left(Failure(Constants.socketError));
      } else if (e.code == "too-many-requests") {
        return Left(Failure("Too many requests, try again"));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on ConnectionException {
      return Left(Failure(Constants.socketError));
    } on TimeoutException {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      return Left(Failure(Constants.unknownError));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    print("Email to reset: $email");
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      debugPrint("Error: ${e.code}");
      if (e.code == 'invalid-email') {
        return Left(Failure("You provided an invalid email address"));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on ConnectionException catch (_) {
      return Left(Failure(Constants.socketError));
    } on TimeoutException catch (_) {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      return Left(Failure(Constants.unknownError));
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerException("No user found for this email");
    } on ConnectionException catch (e) {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } catch (e) {
      throw ServerException(Constants.unknownError);
    }
  }

  @override
  Future<bool> verifyAuth() async {
    final User? user = _auth.currentUser;
    print("Current user: $user");
    if (user == null) {
      print("User is null");
      return true;
    } else {
      print("User is not null");
      return false;
    }
  }
}
