import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_sync/src/features/authentication/domain/usecases/sign_in_usecase.dart';

import './sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase _usecase;

  SignInCubit(this._usecase) : super(SignInInitial());

  Future<void> signIn(Map<String, dynamic> data) async {
    emit(SignInLoading());
    try {
      final result = await _usecase.execute(data);
      emit(
        result.fold(
          (failure) => SignInError(failure.message),
          (n) => SignInSuccess(),
        ),
      );
    } catch (error) {
      emit(
        SignInError(
          error.toString(),
        ),
      );
    }
  }
}
