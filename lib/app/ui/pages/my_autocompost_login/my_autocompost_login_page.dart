import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/global_widgets/custom_input_field.dart';
import 'package:autocompost/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:autocompost/app/ui/pages/login/utils/send_login_form.dart';
import 'package:autocompost/app/ui/pages/my_autocompost_login/controller/my_autocompost_login_controller.dart';
import 'package:autocompost/app/ui/pages/my_autocompost_login/utils/send_autocompost_login_form.dart';
import 'package:autocompost/app/ui/pages/register/utils/send_register_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final myCompostProvider = SimpleProvider(
    (_) => MyAutoCompostLoginController()
);

class MyAutoCompostLoginPage extends StatefulWidget {

  const MyAutoCompostLoginPage({Key? key}) : super(key: key);

  @override
  State<MyAutoCompostLoginPage> createState() => _MyAutoCompostLoginPageState();
}

class _MyAutoCompostLoginPageState extends State<MyAutoCompostLoginPage> {
  final database = FirebaseDatabase.instance.ref();
  final uidUser = FirebaseAuth.instance.currentUser?.uid;

  late String userUid;

  @override
  Widget build(BuildContext context) {

    return ProviderListener <MyAutoCompostLoginController>(
      provider: myCompostProvider,
      builder: (_, controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Registra tu compostera'),
          ),
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
                  child: ListView(
                    children: [
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
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () => sendAutoCompostLoginForm(context),
                        child: const Text("Vincula tu compostera"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
