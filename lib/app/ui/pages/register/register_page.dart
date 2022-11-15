import 'package:autocompost/app/ui/global_widgets/custom_input_field.dart';
import 'package:autocompost/app/ui/pages/register/controller/register_controller.dart';
import 'package:autocompost/app/ui/pages/register/controller/register_state.dart';
import 'package:autocompost/app/ui/pages/register/utils/send_register_form.dart';
import 'package:autocompost/app/utils/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:autocompost/app/utils/name_validator.dart';
import 'package:flutter_meedu/ui.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
    (_) => RegisterController(),
);

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: Colors.transparent,
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomInputFiled(
                      label: "Name",
                      onChanged: controller.onNameChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidName(text)?null : "invalid name";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputFiled(
                      label: "Last Name",
                      onChanged: controller.onLastNameChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidName(text)?null : "invalid last name";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputFiled(
                      label: "Mail",
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.onMailChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidEmail(text)?null : "invalid mail";
                      },
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 15),
                    Consumer(
                      builder: (_, watch,__) {
                        watch;
                        return CustomInputFiled(
                          label: "Verification password",
                          onChanged: controller.onVPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if(text == null) return null;
                            if(controller.state.password != text) {
                              return "passwords don't match";
                            }
                            if(text.trim().length>=6) {
                              return null;
                            }
                            return "invalid password";
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    CupertinoButton(
                      color: Colors.green,
                      onPressed: () => sendRegisterForm(context),
                      child: const Text("REGISTER"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
