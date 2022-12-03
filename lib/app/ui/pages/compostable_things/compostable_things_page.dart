import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/compostable_things/compostables.dart';
import 'package:autocompost/app/ui/pages/compostable_things/no_compostables.dart';


class CompostableThingsPage extends StatefulWidget {
  const CompostableThingsPage({Key? key}) : super(key: key);

  @override
  State<CompostableThingsPage> createState() => _CompostableThingsPage();
}

class _CompostableThingsPage extends State<CompostableThingsPage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Residuos',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            bottom: TabBar(
              tabs: [
              Tab(
                child: Text('Compostables',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            Tab(
              child: Text('No compostables',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView.builder(
                  itemCount: compostables.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                          title: Text(compostables[index].title,),
                          leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(compostables[index].imageSrc),
                       ),
                      ),
                    );
                  },
              ),
            ),

            Center(
              child: ListView.builder(
                itemCount: noCompostables.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                        title: Text(noCompostables[index].title),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(noCompostables[index].imageSrc),
                        ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}