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
    (_) => LoginController(),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener <LoginController> (
      provider: loginProvider,
      builder: (_, controller){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('AutoCompost App'),),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                height: double.infinity,
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formKey,
                  child: ListView (
                    children: [
                      const SizedBox(height: 20),
                      Image.asset('assets/images/lhead.png', width: 300,),
                      const Padding (
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Text("Mi compostera app",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'titl_login',
                              color: Colors.lightGreen),
                        ),
                      ),
                      CustomInputFiled(
                        label: "Email",
                        onChanged: controller.onEmailChanged,
                        inputType: TextInputType.emailAddress,
                        validator: (text) {
                          if(text == null) return null;
                          return isValidEmail(text)?null : "invalid mail";
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputFiled(
                        label: "Password",
                        onChanged: controller.onPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          if(text == null) return null;
                          if(text.trim().length>=6) {
                            return null;
                          }
                          return "invalid password";
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () => sendLoginForm(context),
                        child: const Text("Sign in"),
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
              child: const Text("Sign up"),
            ),
          ],
        );
      },
    );
  }
}
