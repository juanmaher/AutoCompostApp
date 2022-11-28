import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptions.dart';
import 'package:autocompost/app/ui/pages/compost_types/compost_types.dart';
import 'package:flutter_meedu/ui.dart';

class CompostTypesInfo extends StatelessWidget{
  final CompostTypes compostTypes;

  const CompostTypesInfo({Key? key, required this.compostTypes}) : super (key:key);
  @override
  Widget build (BuildContext context){
    return Container(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListView(
            children: <Widget>[
                Text(
                  compostTypes.title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'titl_login',
                  ),
                ),
                Text(
                  compostTypes.description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: 'OpenSans',
                  ),
                 // textAlign: TextAlign.center,
                ),
              Image.asset(compostTypes.imageSrc,
                height: compostTypes.imageHeight,
                width: compostTypes.imageWidth,
                //fit: BoxFit.cover,
                //alignment: Alignment.center,
              ),
              SizedBox(height: 10),
              Text(
                "Ventajas",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
              ),
              Text(
                compostTypes.advantages,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: 'OpenSans',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Desventajas",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
              ),

              Text(
                compostTypes.disadvantages,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
        ),
    );
  }
}