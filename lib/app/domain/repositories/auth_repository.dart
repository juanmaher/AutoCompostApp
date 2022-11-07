import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository{
  // Si devuelve null es porque no hay una sesion activa en el dispositivo
  Future<User?> get user;
}