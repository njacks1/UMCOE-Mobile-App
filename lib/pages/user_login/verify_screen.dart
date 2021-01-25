import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'login_register_routes.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    //TODO: Ask UM to approve of our email for verification purposes
    //TODO: Possibly need to create our own domain
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Need to make this look better
    return Container(child: Center(child: Text('High')));
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    print('test');
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushNamed(WelcomeScreenRoutes.homePage);
    }
  }
}
