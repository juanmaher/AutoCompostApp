import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/tips/tips.dart';
import 'package:flutter_svg/svg.dart';


class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  State<TipsPage> createState() => _TipsPage();
}

class _TipsPage extends State<TipsPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consejos para compostar',style: TextStyle(color: Colors.white),),
        ),
         body: Center(
              child: ListView.builder(
                itemCount: tips.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(tips[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      subtitle: Text(tips[index].subtitle) ,
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(tips[index].imageSrc),
                      ),
                    ),
                  );
                },
              ),
            ),
      ),
    );
  }
}