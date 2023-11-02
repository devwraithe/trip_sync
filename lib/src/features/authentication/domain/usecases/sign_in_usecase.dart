import 'package:dartz/dartz.dart';

import '../../../../core/utilities/errors/failure.dart';
import '../auth_repository.dart';

class SignInUsecase {
  final AuthRepository _repository;
  SignInUsecase(this._repository);

  Future<Either<Failure, void>> execute(Map<String, dynamic> data) async {
    final response = await _repository.signIn(data);
    return response.fold(
      (failure) => Left(failure),
      (user) => const Right(null),
    );
  }
}
