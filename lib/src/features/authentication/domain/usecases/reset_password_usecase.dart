import 'package:dartz/dartz.dart';

import '../../../../core/utilities/errors/failure.dart';
import '../auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository _repository;
  ResetPasswordUsecase(this._repository);

  Future<Either<Failure, void>> execute(String data) async {
    final response = await _repository.resetPassword(data);
    return response.fold(
      (failure) => Left(failure),
      (user) => const Right(null),
    );
  }
}
