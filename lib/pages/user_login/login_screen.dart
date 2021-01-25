import 'package:coe_mobile_app/constants/fonts.dart';
import 'package:coe_mobile_app/custom_alert_dialog/CustomShowDialog.dart';
import 'package:coe_mobile_app/pages/user_login/login_register_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isSubmitting = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    void showAlertDialog(BuildContext context){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(

            content: Container(
              width: mq.size.width/1.5,
              height: mq.size.height/4.5,
              color: Color(0xff1f4d2f),
              child: Text(
                "Your email has not been verified yet... Please check your email for a verification link!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          );
        }
      );
    }

    _displaySnackBarInvalidAccount(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
        content: Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hmm... We cannot find that account! :/",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _displaySnackBarNothing(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
        content: Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You gotta enter somethin' for magic to happen!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _displaySnackBarNoEmail(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
        content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You did not enter an email!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _displaySnackBarInvalidPassword(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
        content: Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Incorrect password entered!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _displaySnackBarInvalidEmail(BuildContext context) {
      final snackBar = SnackBar(
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
        content: Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Invalid email entered!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    final logo = Image.asset(
      'images/um_logo.png',
      height: mq.size.height / 4.5,
    );

    final emailField = TextFormField(
      //enabled: isSubmitting,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontFamily: font,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "user@miami.edu",
        labelText: "Email",
        hintStyle: TextStyle(
          fontFamily: font,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          fontSize: 18.0,
          fontFamily: font,
          color: Colors.white,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          //enabled: isSubmitting,
          obscureText: true,
          controller: _passwordController,
          style: TextStyle(
            fontFamily: font,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: "password",
            labelText: "Password",
            hintStyle: TextStyle(
              fontFamily: font,
              color: Colors.grey,
            ),
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontFamily: font,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                ),
                onPressed: () {
                  showAlertDialog(context);
                  // TODO: Perfect pop-up above
                }),
          ],
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
          passwordField,
        ],
      ),
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
        onPressed: () async {
          print("Login Pressed");
          try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
            );
            //FirebaseAuth auth = FirebaseAuth.instance;                          //don't think this line is necessary
            //User user = auth.currentUser;
            User user = FirebaseAuth.instance.currentUser;
            //TODO: Make this a separate class to have a timer initiated
            if(user.emailVerified){
              print("Verified");
              Navigator.of(context).pushNamed(WelcomeScreenRoutes.homePage);
            }
            else{
              showAlertDialog(context);
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              //Incorrect email entered
              _displaySnackBarInvalidAccount(context);
              print('No user found for that email.');                           //Here for debugging purposes ONLY
            } else if (e.code == 'wrong-password' && _passwordController.text != "") {
              //Wrong password for email provided
              _displaySnackBarInvalidPassword(context);
              _passwordController.text = "";
              print('Wrong password provided for that user.');                  //Here for debugging purposes ONLY
            }
            else if (e.code == 'wrong-password' && _passwordController.text == ""){
              //nothing for both fields were entered
              _displaySnackBarNothing(context);
            }
            else if(_emailController.text == "" && _passwordController.text != ""){
              //password was entered but no email
              _displaySnackBarNoEmail(context);
            }
            else {
              //Invalid email entered
              _displaySnackBarInvalidEmail(context);
              _emailController.text = "";
              print('Invalid Email Entered');
            }
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a member?",
              style:
                TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WelcomeScreenRoutes.authRegister);
              },
              child: Text(
                "Sign Up",
                style:
                  TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
              ),
            ),
          ],
        ),
      ],
    );
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff1f4d2f),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
              height: mq.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: logo,
                  ),
                  fields,
                  Padding(
                    padding: EdgeInsets.only(bottom: 150),
                    child: bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}