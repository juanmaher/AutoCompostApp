import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:autocompost/app/ui/pages/steps/steps_component.dart';
import 'package:flutter_meedu/ui.dart';

class StepComponentList extends StatelessWidget{
  final StepComponent stepComponent;

  const StepComponentList({Key? key, required this.stepComponent}) : super (key:key);
  @override
  Widget build (BuildContext context){
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: (){
          //router.pushNamed(stepComponent.routePage);
        },
        child: Container(
          height: 800,
          width: 300,
          decoration: BoxDecoration(
            color: stepComponent.color,
            borderRadius: BorderRadius.circular(30),
            image : DecorationImage(
              image: AssetImage(stepComponent.imageSrc),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
