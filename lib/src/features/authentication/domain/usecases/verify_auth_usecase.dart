import '../auth_repository.dart';

class VerifyAuthUsecase {
  final AuthRepository _repo;
  VerifyAuthUsecase(this._repo);

  Future<bool> execute() async {
    return await _repo.verifyAuth();
  }
}
