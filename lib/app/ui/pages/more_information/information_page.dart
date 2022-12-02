import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/more_information/more_information.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';


class MoreInformationPage extends StatefulWidget {
  const MoreInformationPage({Key? key}) : super(key: key);

  @override
  State<MoreInformationPage> createState() => _MoreInformationPage();
}

class _MoreInformationPage extends State<MoreInformationPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tips para compostar',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: moreInformation.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(moreInformation[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(moreInformation[index].subtitle) ,
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset('assets/images/link_icon.svg'),
                  ),
                  onTap: (){
                   _launchUrl(moreInformation[index].link);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _launchUrl(String adr) async{
    final Uri linkUrl = Uri.parse(adr);
    launchUrl(linkUrl, mode: LaunchMode.externalApplication,);
  }

}