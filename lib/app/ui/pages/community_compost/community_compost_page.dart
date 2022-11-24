import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class CommunityCompostPage extends StatefulWidget {
  const CommunityCompostPage({Key? key}) : super(key: key);

  @override
  State<CommunityCompostPage> createState() => _CommunityCompostPage();
}

class _CommunityCompostPage extends State<CommunityCompostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Back')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //crossAxisSize: CrossAx
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding (
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text("Composteras\nComunitarias",
                style: TextStyle(

                    fontSize: 30,
                    fontFamily: 'titl_login',
                    color: Colors.lightGreen),
              ),
            ),
            const Padding (
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Show in:",
                style: TextStyle(fontSize: 20,),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width:240,
              child:CupertinoButton(
                color: Colors.green,
                child: const Text("Google maps"),
                onPressed: () {
                  router.pushNamed(Routes.PERMISSIONS);
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width:240,
              child: CupertinoButton(
                color: Colors.green,
                child: const Text("List"),
                onPressed: () {
                  router.pushNamed(Routes.LIST);
                },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
