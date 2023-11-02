import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utilities/errors/failure.dart';
import '../auth_repository.dart';

class SignUpUsecase {
  final AuthRepository _repository;
  SignUpUsecase(this._repository);

  Future<Either<Failure, User?>> execute(Map<String, dynamic> data) async {
    final response = await _repository.signUp(data);
    return response.fold(
      (failure) => Left(failure),
      (user) => Right(user),
    );
  }
}
