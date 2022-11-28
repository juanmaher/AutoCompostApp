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
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page')),
      body: Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          children: <Widget>[
            Consumer(
              builder: (_, ref, __){
                final user = ref.watch(sessionProvider).user!;
                return Text(user.uid);
              }
            ),
            GestureDetector(
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color(0xFF23631F),
                        image: DecorationImage(
                            image:AssetImage("assets/images/CompostIcon.png"),
                            fit:BoxFit.fill
                        ),
                    )
                ),onTap:(){
              if (composterId != '') {
                router.pushNamedAndRemoveUntil(Routes.MY_AUTOCOMPOST);
              } else {
                router.pushNamedAndRemoveUntil(Routes.MY_AUTOCOMPOST_LOGIN);
              }
            }
            ),
            SizedBox(height: 20),
            GestureDetector(
                child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFF18A95C),
                      image: DecorationImage(
                          image:AssetImage("assets/images/CompostComunit.png"),
                          fit:BoxFit.fill
                      ),
                    )
                ),onTap:() {
              router.pushNamed(Routes.COMMUNITY_COMPOST);
             },
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Color(0xFF3E8C36),
                    image: DecorationImage(
                        image:AssetImage("assets/images/ComoCompost.png"),
                        fit:BoxFit.cover
                    ),
                  )
              ),onTap:() {
              router.pushNamed(Routes.COMPOST_MANUAL);
             },
            ),
            SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: Text("sign out"),
              onPressed: () async {
                await Get.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
