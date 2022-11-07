import 'dart:async';
import 'dart:developer';

import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{

  final FirebaseAuth _auth;
  User? _user;
  final Completer<void> _completer = Completer();

  AuthenticationRepositoryImpl(this._auth) {
    _init();
  }

  @override
  // Devuelve un Future porque necesita por lo menos escuchar una vez el listen
  Future<User?> get user async {
    // Espera a que se modifique el _completer
    await _completer.future;
    return _user;
  }

  void _init() async {
    _auth.authStateChanges().listen(
        (User? user) {
          // Con esto te aseguras que una vez ya se llamo al listen
          if(!_completer.isCompleted) {
            _completer.complete();
          }
          _user = user;
        });
  }
}