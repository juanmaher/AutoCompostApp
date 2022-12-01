import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

late String composterId;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = HomeController();

  @override
  void initState() {
    super.initState();

    _getComposterId();
  }

  void _getComposterId() {
    final String userUid = sessionProvider.read.user!.uid;
    FirebaseDatabase.instance.ref().child('/users/$userUid/composter_id').onValue.listen((event) {
      final String _composterId = (event.snapshot.value ?? '') as String;
      setState(() {
        composterId = _composterId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Obtengo el alto y el ancho de la pantalla
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('AutoCompost')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                // Solo tomo el 20% del alto de la pantalla
                height: size.height * 0.12,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 20,
                        bottom: 0,
                      ),
                      height: size.height * 0.2 - 50,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Consumer(
                              builder: (_, ref, __){
                                final user = ref.watch(sessionProvider).user!;
                                final String? name = user.displayName;
                                final String msg = '¡Hola ${name ?? 'amigo'}!';
                                return Text(
                                  msg,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              ),

              const SizedBox(height: 10),
              GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade300,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade300,
                        image: const DecorationImage(
                          image:AssetImage("assets/images/CompostIcon.png"),
                          fit:BoxFit.contain,
                          opacity: 0.9,
                        ),
                    ),
                    )
                  ),onTap:(){
                if (composterId != '') {
                  router.pushNamed(Routes.MY_AUTOCOMPOST);
                } else {
                  router.pushNamed(Routes.MY_AUTOCOMPOST_LOGIN);
                }
              }
              ),
              GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green.shade500,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:AssetImage("assets/images/CompostComunit.png"),
                          fit:BoxFit.contain,
                          opacity: 0.9,
                        ),
                      ),
                    ),
                  ),onTap:() {
                router.pushNamed(Routes.COMMUNITY_COMPOST);
               },
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green.shade700,
                    image: const DecorationImage(
                      image:AssetImage("assets/images/ComoCompost.png"),
                      fit:BoxFit.contain,
                      alignment: Alignment.center,
                      opacity: 0.9,
                    ),
                  )
                ),onTap:() {
                router.pushNamed(Routes.COMPOST_MANUAL);
               },
              ),
              const SizedBox(height: 20),

              CupertinoButton(
                color: Colors.green,
                child: const Text(
                  "Sign out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  await Get.find<AuthenticationRepository>().signOut();
                  router.pushNamedAndRemoveUntil(Routes.LOGIN);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
