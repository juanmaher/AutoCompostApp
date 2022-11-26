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
            borderRadius: BorderRadius.circular(30),
            image : DecorationImage(
              image: AssetImage(manualOption.imageSrc),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child:Text(manualOption.title,
                style: TextStyle(
                fontSize: 40,
                color: Colors.grey[300],
            ),
          ),
         ),
        ),
      ),
      );
  }
}
