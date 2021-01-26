import 'package:coe_mobile_app/pages/user_login/login_register_routes.dart';
import 'package:flutter/material.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      'images/um_logo.png',
      height: mq.size.height/4.5,
    );

    final backgroundImage = Image.asset(
      'images/login_screen_background_test.png',
      height: mq.size.height,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white, //need to change this
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: font,
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        onPressed: () {
          print("Login Pressed");
          Navigator.of(context).pushNamed(WelcomeScreenRoutes.authLogin);
        },
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white, //need to change this
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: font,
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          print("Register Pressed");
          //TODO: Test
          Navigator.of(context).pushNamed(WelcomeScreenRoutes.authRegister);
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 100),
          child: registerButton,
        ),
        //registerButton,
      ],
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login_screen_background_test.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: logo,
              ),
              buttons,
              //backgroundImage,
            ],
          ),
        ),
      ),
    );
  }
}
