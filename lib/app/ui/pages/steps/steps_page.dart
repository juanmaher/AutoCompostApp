import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:autocompost/app/ui/pages/steps/steps_component.dart';




class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPage();
}

class _StepsPage extends State<StepsPage> {

  final double width = 325;

  Widget _buildItemList(BuildContext context, int index){
    if(index == stepComponent.length) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: stepComponent[index].color,
              borderRadius: BorderRadius.circular(20),
              image : DecorationImage(
                image: AssetImage(stepComponent[index].imageSrc),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.08), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
            height: 600,

            child: Container(
              decoration: BoxDecoration(
                image : DecorationImage(
                  image: AssetImage(stepComponent[index].imageIcon),
                  opacity: 0.2,
                ),
              ),

              child: Center(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Text(stepComponent[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontFamily: "Caveat",
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 25,
                      ),
                      child: Text(
                        stepComponent[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Caveat",
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),
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
        title: Text('Guía para compostar',style: TextStyle(color: Colors.white),),
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