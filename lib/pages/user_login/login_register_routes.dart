import 'package:coe_mobile_app/pages/user_login/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:coe_mobile_app/pages/user_login/login_screen.dart';
import 'package:coe_mobile_app/pages/user_login/register_screen.dart';
import 'package:coe_mobile_app/pages/HomePage.dart';

class WelcomeScreenRoutes {
  WelcomeScreenRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String homePage = '/home-page';
  static const String verifyScreen = '/verify-screen';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      homePage: (context) => MenuDashboardLayout(),
      verifyScreen: (context) => VerifyScreen(),
    };
  }
}