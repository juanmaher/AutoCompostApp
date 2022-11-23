
import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  String _email = '', _password = '';
  final _authenticationRepository = Get.find<AuthenticationRepository>();

  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> submit() {
    return _authenticationRepository.signInWithEmailAndPassword(
        _email,
        _password
    );
  }
}