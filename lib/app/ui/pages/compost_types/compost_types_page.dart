import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/compost_types/compost_types.dart';
import 'package:autocompost/app/ui/pages/compost_types/compost_types_info.dart';


class CompostTypesPage extends StatefulWidget {
  const CompostTypesPage({Key? key}) : super(key: key);

  @override
  State<CompostTypesPage> createState() => _CompostTypesPage();
}

class _CompostTypesPage extends State<CompostTypesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: compostTypes.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tipos de composteras',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(
            isScrollable:true,
            tabs: [
              Tab(
                child: Text(compostTypes[0].title,style: TextStyle(color: Colors.white,),),
              ),
              Tab(
                child: Text(compostTypes[1].title,style: TextStyle(color: Colors.white,),),
              ),
              Tab(
                child: Text(compostTypes[2].title,style: TextStyle(color: Colors.white,),),
              ),
              Tab(
                child: Text(compostTypes[3].title,style: TextStyle(color: Colors.white,),),
              ),
              Tab(
                child: Text(compostTypes[4].title,style: TextStyle(color: Colors.white,),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
              CompostTypesInfo( compostTypes: compostTypes[0]),
              CompostTypesInfo( compostTypes: compostTypes[1]),
              CompostTypesInfo( compostTypes: compostTypes[2]),
              CompostTypesInfo( compostTypes: compostTypes[3]),
              CompostTypesInfo( compostTypes: compostTypes[4]),
          ],
        ),
      ),
    );
  }
}