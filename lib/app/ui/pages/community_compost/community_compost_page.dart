import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class CommunityCompostPage extends StatefulWidget {
  const CommunityCompostPage({Key? key}) : super(key: key);

  @override
  State<CommunityCompostPage> createState() => _CommunityCompostPage();
}

class _CommunityCompostPage extends State<CommunityCompostPage> {

  @override
  Widget build(BuildContext context) {
    // Obtengo el alto y el ancho de la pantalla
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Compostera Comunitarias')),
      body: Center(
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
                    height: size.height * 0.2 - 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                    ),
                    child: Row(
                      children: <Widget>[
                        Consumer(
                            builder: (_, ref, __){
                              return Text(
                                'Navega',
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
            const SizedBox(height: 40),

            GestureDetector(
              child: SizedBox(
                height: 180,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Image.asset('assets/images/maps.png',
                            fit: BoxFit.fitWidth,
                            height: 80,
                            alignment: Alignment.center,
                            opacity: const AlwaysStoppedAnimation(.6),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                                top: 25
                              ),
                              child: Text(
                                'Mapa',
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap:() {
                router.pushNamed(Routes.PERMISSIONS);
              },
            ),


            GestureDetector(
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Image.asset('assets/images/compostera_titulo.jpg',
                            fit: BoxFit.fitWidth,
                            height: 80,
                            alignment: Alignment.center,
                            opacity: const AlwaysStoppedAnimation(.6),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25,
                                  top: 25
                              ),
                              child: Text(
                                'Lista',
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap:() {
                router.pushNamed(Routes.LIST);
              },
            ),
          ],
        ),
      ),
    );
  }
}
