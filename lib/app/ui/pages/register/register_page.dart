import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/global_widgets/custom_input_field.dart';
import 'package:autocompost/app/ui/global_widgets/dialogs/dialogs.dart';
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
    (_) => RegisterController(sessionProvider.read),
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
          appBar: AppBar(
              title: const Text('Registrate')),
          body: GestureDetector(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  children: [
                    CustomInputFiled(
                      label: "Nombre",
                      onChanged: controller.onNameChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidName(text)?null : "Nombre inválido";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputFiled(
                      label: "Apellido",
                      onChanged: controller.onLastNameChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidName(text)?null : "Apellido inválido";
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputFiled(
                      label: "Mail",
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.onMailChanged,
                      validator: (text) {
                        if(text == null) return null;
                        return isValidEmail(text)?null : "Mail inválido";
                      },
                    ),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 15),
                    Consumer(
                      builder: (_, watch,__) {
                        watch;
                        return CustomInputFiled(
                          label: "Repetir contraseña",
                          onChanged: controller.onVPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if(text == null) return null;
                            if(controller.state.password != text) {
                              return "Contraseñas no coincidentes";
                            }
                            if(text.trim().length>=6) {
                              return null;
                            }
                            return "Constraseña inválida";
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomInputFiled(
                      label: "ID Compostera",
                      onChanged: controller.onComposterIdChanged,
                      validator: (text) {
                        if(text == null) return null;
                        if(text.trim().length >= 6 || text.trim().isEmpty) {
                          return null;
                        }
                        return "ID inválido";
                      },
                    ),
                    GestureDetector(
                      child: const Text(
                        'Más información',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      onTap: () {
                        Dialogs.alert(
                          context,
                          title: "ID Compostera",
                          content: "Este campo debe ser llenado con el número de serie de la compostera que ha comprado, "
                              "el cual se puede encontrar en su etiqueta identificatoria. Si usted no ha adquirido una compostera aún, "
                              "no complete este campo.",
                        );
                      },
                    ),

                    const SizedBox(height: 15),
                    CupertinoButton(
                      color: Colors.green,
                      onPressed: () => sendRegisterForm(context),
                      child: const Text(
                        "Ingresa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
