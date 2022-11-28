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
          title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (_, ref, __) {
                final user = ref.watch(sessionProvider).user!;
                return Text(user.uid);
              }
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("sign out"),
              onPressed: () async {
                await sessionProvider.read.signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("Composteras Comunitarias"),
              onPressed: () {
                router.pushNamed(Routes.COMMUNITY_COMPOST);
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("Mi Compostera"),
              onPressed: () async {
                if (composterId != '') {
                  router.pushNamedAndRemoveUntil(Routes.MY_AUTOCOMPOST);
                } else {
                  router.pushNamedAndRemoveUntil(Routes.MY_AUTOCOMPOST_LOGIN);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
