import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptions.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

class ManualOptionList extends StatelessWidget{
  final ManualOptions manualOption;

  const ManualOptionList({Key? key, required this.manualOption}) : super (key:key);
  @override
  Widget build (BuildContext context){
    return AspectRatio(
        aspectRatio: 1.65,
        child: GestureDetector(
          onTap: (){
            router.pushNamed(manualOption.routePage);
          },
        child: Container(
          height: 1,
          decoration: BoxDecoration(
            color: manualOption.color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        manualOption.title,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                          textAlign: TextAlign.start,
                      ),
                      Text(
                        manualOption.description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(width: 0),

              AspectRatio(
                aspectRatio: 0.75,
                child: Image.asset(manualOption.imageSrc,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                    //opacity: AlwaysStoppedAnimation(0.6) ,
                ),
              ),

            ],
          ),
        ),
      ),
      );
  }
}
