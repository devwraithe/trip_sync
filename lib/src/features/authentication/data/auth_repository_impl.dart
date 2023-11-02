import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    print(data);
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

  // @override
  // Future<void> signIn(Map<String, dynamic> data) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(
  //       email: data['email'],
  //       password: data['password'],
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print("ERROR: ${e.code}");
  //     if (e.code == 'user-not-found') {
  //       throw ServerException("No user found for this email");
  //     } else if (e.code == 'wrong-password') {
  //       throw ServerException("You have entered an incorrect password");
  //     } else if (e.code == 'invalid-email') {
  //       throw ServerException("You provided an invalid email address");
  //     } else if (e.code == "network-request-failed") {
  //       throw ConnectionException(Constants.socketError);
  //     }
  //   } on SocketException catch (e) {
  //     throw ConnectionException(Constants.socketError);
  //   } on TimeoutException catch (e) {
  //     throw ConnectionException(Constants.timeoutError);
  //   } catch (e) {
  //     throw ServerException(Constants.unknownError);
  //   }
  // }
  //
  // @override
  // Future<void> resetPassword(String email) async {
  //   try {
  //     await _auth.sendPasswordResetEmail(
  //       email: email,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     debugPrint("ServerException: $e");
  //     if (e.code == 'user-not-found') {
  //       throw ServerException("No user found for this email");
  //     } else if (e.code == 'invalid-email') {
  //       throw ServerException("You provided an invalid email address");
  //     }
  //   } on SocketException catch (_) {
  //     throw ConnectionException(Constants.socketError);
  //   } on TimeoutException catch (_) {
  //     throw ConnectionException(Constants.timeoutError);
  //   } catch (e) {
  //     throw ServerException(Constants.unknownError);
  //   }
  // }
  //
  // @override
  // Future<void> logout() async {
  //   try {
  //     await _auth.signOut();
  //   } on FirebaseAuthException catch (e) {
  //     throw ServerException("No user found for this email");
  //   } on SocketException catch (e) {
  //     throw ConnectionException(Constants.socketError);
  //   } on TimeoutException catch (_) {
  //     throw ConnectionException(Constants.timeoutError);
  //   } catch (e) {
  //     throw ServerException(Constants.unknownError);
  //   }
  // }
  //
  // @override
  // Future<bool> verifyAuth() async {
  //   final User? user = _auth.currentUser;
  //   return user != null;
  // }
}
