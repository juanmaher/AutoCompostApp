import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/pages/login/login_page.dart';
import 'package:autocompost/app/ui/pages/maps/maps_page.dart';
import 'package:autocompost/app/ui/pages/list/list_page.dart';
import 'package:autocompost/app/ui/pages/register/register_page.dart';
import 'package:autocompost/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:autocompost/app/ui/pages/splash/splash_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:autocompost/app/ui/pages/community_compost/community_compost_page.dart';
import 'package:autocompost/app/ui/pages/compost_manual/compost_manual_page.dart';
import 'package:autocompost/app/ui/pages/steps/steps_page.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_)=> const SplashPage(),
    Routes.LOGIN:(_)=> const LoginPage(),
    Routes.PERMISSIONS:(_)=> const RequestPermissionPage(),
    Routes.HOME:(_)=> const HomePage(),
    Routes.REGISTER: (_)=> const RegisterPage(),
    Routes.MAPS:(_)=> const MapsPage(),
    Routes.LIST:(_)=> const ListPage(),
    Routes.COMMUNITY_COMPOST:(_)=> const CommunityCompostPage(),
    Routes.COMPOST_MANUAL:(_)=> const CompostManualPage(),
    Routes.STEPS:(_)=> const StepsPage(),
  };
}