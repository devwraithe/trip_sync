import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/authentication/data/auth_repository_impl.dart';
import '../../../features/authentication/domain/auth_repository.dart';
import '../../../features/authentication/domain/usecases/reset_password_usecase.dart';
import '../../../features/authentication/domain/usecases/sign_in_usecase.dart';
import '../../../features/authentication/domain/usecases/sign_up_usecase.dart';
import '../../../features/authentication/domain/usecases/verify_auth_usecase.dart';
import '../../../features/authentication/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import '../../../features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import '../../../features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../../features/authentication/presentation/cubits/verify_auth_cubit/verify_auth_cubit.dart';
import '../services/di_service.dart';

void signUpInjector() {
  regSingleton(() => SignUpCubit(sl()));
  regSingleton(() => SignUpUsecase(sl()));
}

void signInInjector() {
  regSingleton(() => SignInCubit(sl()));
  regSingleton(() => SignInUsecase(sl()));
}

void resetPasswordInjector() {
  regSingleton(() => ResetPasswordCubit(sl()));
  regSingleton(() => ResetPasswordUsecase(sl()));
}

void verifyAuthInjector() {
  regSingleton(() => VerifyAuthCubit(sl()));
  regSingleton(() => VerifyAuthUsecase(sl()));
}

// Core injector for repo
void authInjector() {
  regSingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  regSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
