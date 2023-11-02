import 'package:flutter_bloc/flutter_bloc.dart';

import './sign_up_state.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase _usecase;

  SignUpCubit(this._usecase) : super(SignUpInitial());

  Future<void> signUp(Map<String, dynamic> data) async {
    emit(SignUpLoading());
    try {
      final result = await _usecase.execute(data);
      emit(
        result.fold(
          (failure) => SignUpError(failure.message),
          (user) => SignUpSuccess(user),
        ),
      );
    } catch (error) {
      emit(
        SignUpError(
          error.toString(),
        ),
      );
    }
  }
}
