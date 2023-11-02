import 'package:flutter_bloc/flutter_bloc.dart';

import './reset_password_state.dart';
import '../../../domain/usecases/reset_password_usecase.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase _usecase;

  ResetPasswordCubit(this._usecase) : super(ResetPasswordInitial());

  Future<void> resetPassword(String data) async {
    emit(ResetPasswordLoading());
    try {
      final result = await _usecase.execute(data);
      emit(
        result.fold(
          (failure) => ResetPasswordError(failure.message),
          (n) => ResetPasswordSuccess(),
        ),
      );
    } catch (error) {
      emit(
        ResetPasswordError(
          error.toString(),
        ),
      );
    }
  }
}
