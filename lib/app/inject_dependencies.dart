import 'package:autocompost/app/data/repositories_impl/auth_repository_impl.dart';
import 'package:autocompost/app/data/repositories_impl/sign_up_repository_impl.dart';
import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/domain/repositories/sign_up_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';

// Inyecta los repo que se crean en dominio y en datos para que despues en la
// ui pueda usarlo
void injectDependencies() {
  Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<SignUpRepository>(
        () => SignUpRepositoryImpl(FirebaseAuth.instance),
  );
}