import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/pages/login/login_page.dart';
import 'package:autocompost/app/ui/pages/maps/maps_page.dart';
import 'package:autocompost/app/ui/pages/list/list_page.dart';
import 'package:autocompost/app/ui/pages/my_autocompost/my_autocompost_page.dart';
import 'package:autocompost/app/ui/pages/my_autocompost_login/my_autocompost_login_page.dart';
import 'package:autocompost/app/ui/pages/register/register_page.dart';
import 'package:autocompost/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:autocompost/app/ui/pages/splash/splash_page.dart';
import 'package:autocompost/app/ui/pages/temperature/temperature_chart_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:autocompost/app/ui/pages/community_compost/community_compost_page.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_)=> const SplashPage(),
    Routes.LOGIN:(_)=> const LoginPage(),
    Routes.PERMISSIONS:(_)=> const RequestPermissionPage(),
    Routes.HOME:(_)=> const HomePage(),
    Routes.MY_AUTOCOMPOST:(_)=> const MyAutoCompostPage(),
    Routes.MY_AUTOCOMPOST_LOGIN:(_)=> const MyAutoCompostLoginPage(),
    Routes.REGISTER: (_)=> const RegisterPage(),
    Routes.MAPS:(_)=> const MapsPage(),
    Routes.LIST:(_)=> const ListPage(),
    Routes.COMMUNITY_COMPOST:(_)=> const CommunityCompostPage(),
  };
}