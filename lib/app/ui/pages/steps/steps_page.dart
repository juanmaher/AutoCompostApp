import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:autocompost/app/ui/pages/steps/steps_component.dart';




class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPage();
}

class _StepsPage extends State<StepsPage> {

  final double width = 350;

  Widget _buildItemList(BuildContext context, int index){
    if(index == stepComponent.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: stepComponent[index].color,
              borderRadius: BorderRadius.circular(30),
              image : DecorationImage(
                image: AssetImage(stepComponent[index].imageSrc),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.08), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
            width: width,
            height: 600,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(stepComponent[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Text(stepComponent[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: "Caveat",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Image.asset(
                      stepComponent[index].imageIcon,
                      height: 150.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ScrollSnapList(
                  itemBuilder: _buildItemList,
                  itemSize: width,
                  dynamicItemSize: true,
                  itemCount: stepComponent.length, onItemFocus: (int ) {  },
                )
            ),
          ],
        ),
      ),
    );
  }
}