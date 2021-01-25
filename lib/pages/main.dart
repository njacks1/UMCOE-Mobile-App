import 'package:coe_mobile_app/pages/user_login/login_register_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'package:coe_mobile_app/pages/user_login/welcome_screen.dart';


void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: WelcomeScreenRoutes.define(),
      //home:  MenuDashboardLayout(),     //temporarily disabled to test out opening screen
      home: OpeningPage(),
    );
  }
}
