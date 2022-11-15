import 'package:autocompost/app/domain/inputs/sign_up.dart';
import 'package:autocompost/app/domain/repositories/sign_up_repository.dart';
import 'package:autocompost/app/ui/pages/register/controller/register_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState>{
  RegisterController() : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();

  final _signUpRepository = Get.find<SignUpRepository>();

  Future <SignUpResponse> submit() {
    return _signUpRepository.register(
      SignUpData(
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        password: state.password,
      ),
    );
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onLastNameChanged(String text) {
    state = state.copyWith(lastname: text);
  }

  void onMailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}