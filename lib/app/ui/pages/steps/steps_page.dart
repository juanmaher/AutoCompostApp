import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';



class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  State<StepsPage> createState() => _StepsPage();
}

class _StepsPage extends State<StepsPage> {

  List<int> data = [
    10,9,8,7,6,5,4,3,2,1
  ];

  Widget _buildItemList(BuildContext context, int index){
    if(index == data.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            width: 300,
            height: 600,
            child: Center(
              child: Text('${data[index]}',style: TextStyle(fontSize: 50.0,color: Colors.black),),
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
                  itemSize: 300,
                  dynamicItemSize: true,
                  onReachEnd: (){
                    print('Done!');
                  },
                  itemCount: data.length, onItemFocus: (int ) {  },
                )
            ),
          ],
        ),
      ),
    );
  }
}