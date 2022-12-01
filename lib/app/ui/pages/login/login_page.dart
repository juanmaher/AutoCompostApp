import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/global_widgets/custom_input_field.dart';
import 'package:autocompost/app/ui/pages/login/controller/login_controller.dart';
import 'package:autocompost/app/ui/pages/login/utils/send_login_form.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:autocompost/app/utils/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final loginProvider = SimpleProvider(
    (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener <LoginController> (
      provider: loginProvider,
      builder: (_, controller){
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                height: double.infinity,
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Form(
                  key: controller.formKey,
                  child: ListView (
                    children: [
                      const SizedBox(height: 20),
                      const Center (
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 50.0,
                          ),
                          child: Text("AutoCompost",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'dreamline',
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      CustomInputFiled(
                        label: "Mail",
                        onChanged: controller.onEmailChanged,
                        inputType: TextInputType.emailAddress,
                        validator: (text) {
                          if(text == null) return null;
                          return isValidEmail(text)?null : "Mail inválido";
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFiled(
                        label: "Contraseña",
                        onChanged: controller.onPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          if(text == null) return null;
                          if(text.trim().length>=6) {
                            return null;
                          }
                          return "Contraseña inválida";
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () => sendLoginForm(context),
                        child: const Text("Inicia sesión"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          persistentFooterButtons: <Widget> [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () => router.pushNamed(Routes.REGISTER),
              child: const Text("Registrate"),
            ),
          ],
        );
      },
    );
  }
}
