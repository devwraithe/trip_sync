import 'package:firebase_auth/firebase_auth.dart';

import '../../../features/authentication/data/auth_repository_impl.dart';
import '../../../features/authentication/domain/auth_repository.dart';
import '../../../features/authentication/domain/usecases/sign_in_usecase.dart';
import '../../../features/authentication/domain/usecases/sign_up_usecase.dart';
import '../../../features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import '../../../features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import '../services/di_service.dart';

void signUpInjector() {
  regSingleton(() => SignUpCubit(sl()));
  regSingleton(() => SignUpUsecase(sl()));
}

void signInInjector() {
  regSingleton(() => SignInCubit(sl()));
  regSingleton(() => SignInUsecase(sl()));
}

// Core injector for repo
void authInjector() {
  regSingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  regSingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
