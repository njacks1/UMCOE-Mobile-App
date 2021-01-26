import 'package:coe_mobile_app/constants/fonts.dart';
import 'package:coe_mobile_app/users/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_register_routes.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  bool isSubmitting = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      'images/um_logo.png',
      height: mq.size.height / 4.5,
    );

    _displaySnackBarUnequalPasswords(BuildContext context) {
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
                "Passwords do not match!",
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

    _displaySnackBarWeakPassword(BuildContext context) {
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
                "Weak Password! Try a new one...",
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

    _displaySnackBarAccountExists(BuildContext context) {
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
                "There is already an account registered with that email!",
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

    _displaySnackBarWeird(BuildContext context) {
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
                "Something weird happened... Try again?",
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

    _displaySnackBarNonumEmail(BuildContext context) {
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
                "That is not a valid UM Email!",
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

    final firstnameField = TextFormField(
      //enabled: isSubmitting,
      controller: _firstnameController,
      style: TextStyle(
        fontFamily: font,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "John",
        labelText: "Firstname",
        hintStyle: TextStyle(
          fontFamily: font,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          fontFamily: font,
          color: Colors.white,
        ),
      ),
    );

    final lastnameField = TextFormField(
      //enabled: isSubmitting,
      controller: _lastnameController,
      style: TextStyle(
        fontFamily: font,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: "Doe",
        labelText: "Lastname",
        hintStyle: TextStyle(
          fontFamily: font,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          fontFamily: font,
          color: Colors.white,
        ),
      ),
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
          fontFamily: font,
          color: Colors.white,
        ),
      ),
    );

    final passwordField = TextFormField(
      //enabled: isSubmitting,
      controller: _passwordController,
      obscureText: true,
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
          fontFamily: font,
          color: Colors.white,
        ),
      ),
    );

    final repasswordField = TextFormField(
      //enabled: isSubmitting,
      controller: _repasswordController,
      obscureText: true,
      style: TextStyle(
        fontFamily: font,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "password",
        labelText: "Re-Enter Password",
        hintStyle: TextStyle(
          fontFamily: font,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          fontFamily: font,
          color: Colors.white,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          firstnameField,
          lastnameField,
          emailField,
          passwordField,
          repasswordField,
        ],
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
        onPressed: () async {
          print("1");
          print(_emailController.text);
          print("1");
          //print(_emailController.text);
          try {
            if (_passwordController.text == _repasswordController.text &&
                _emailController.text.endsWith('@miami.edu')) {
              UserCredential userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      //email: _emailController.text,
                      email: "maisylam99@gmail.com",
                      password: _passwordController.text);
              User updateUser = FirebaseAuth.instance.currentUser;
              updateUser.updateProfile(displayName: _firstnameController.text);
              userSetup(_firstnameController.text, _lastnameController.text);
              Navigator.of(context).pushNamed(WelcomeScreenRoutes.verifyScreen);
            } else if (_emailController.text.endsWith('@miami.edu') == false) {
              _displaySnackBarNonumEmail(context);
            } else {
              _displaySnackBarUnequalPasswords(context);
              print("passwords dont match");
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              _displaySnackBarWeakPassword(context);
              _passwordController.text = "";
              _repasswordController.text = "";
              print('The password provided is too weak.');
            } else if (e.code == 'email-already-in-use') {
              _displaySnackBarAccountExists(context);
              _emailController.text = "";
              print('The account already exists for that email.');
            }
          } catch (e) {
            print(e);
            _firstnameController.text = "";
            _lastnameController.text = "";
            _passwordController.text = "";
            _repasswordController.text = "";
            _emailController.text = "";
            _displaySnackBarWeird(context);
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WelcomeScreenRoutes.authLogin);
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
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
