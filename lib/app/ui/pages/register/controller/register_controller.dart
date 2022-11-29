import 'package:autocompost/app/domain/inputs/sign_up.dart';
import 'package:autocompost/app/domain/repositories/sign_up_repository.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/register/controller/register_state.dart';
import 'package:autocompost/app/utils/composter_id_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';

class RegisterController extends StateNotifier<RegisterState>{
  final SessionController _sessionController;

  RegisterController(this._sessionController) : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();

  final _signUpRepository = Get.find<SignUpRepository>();

  Future <SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
        state.composterId,
        name: state.name,
        lastname: state.lastname,
        email: state.email,
        password: state.password,
      ),
    );

    if(response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
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

  void onComposterIdChanged(String text) {
    state = state.copyWith(composterId: text);
  }
}