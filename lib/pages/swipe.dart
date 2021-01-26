import 'package:coe_mobile_app/bloc/navigation_bloc.dart';
import 'package:coe_mobile_app/notifier/studentorg_notifier.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:coe_mobile_app/pages/studentorg_swipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coe_mobile_app/notifier/event_notifier.dart';
import 'tutoring_swipe.dart';
import 'events_swipe1.dart';
import 'package:provider/provider.dart';
import 'package:coe_mobile_app/constants/fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/notifier/hkn_notifier.dart';

class MyHomePage extends StatefulWidget with NavigationStates {
  Function onMenuTap1;

  MyHomePage({Key key, this.onMenuTap1}) : super(key: key);

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(onMenuTap: this.onMenuTap1);
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Function onMenuTap;

  _MyHomePageState({this.onMenuTap});

  TabController _tabController;
  TextEditingController _controller = TextEditingController();
  double screenWidth, screenHeight, leftalign;
  String FirstName;

  @override
  void initState() {
    grabUserfName().then((val) {
      FirstName = val;
    });
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<String> grabUserfName() async {
    String temp;
    FirebaseAuth userGrabber = FirebaseAuth.instance;
    String currentUserID = userGrabber.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUserID)
        .get()
        .then((DocumentSnapshot ds) {
      temp = ds.get('fname');
    });
    setState(() {});
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    double leftalign = screenWidth * 1 / 25;
    return (MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (provider1) => StudentOrgNotifier(),
        ),
        ChangeNotifierProvider(
          create: (provider2) => EventsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (provider3) => HknNotifier(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kBackGradient1,
                  kBackGradient2,
                  kBackGradient3,
                  kBackGradient4,
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 1 / 20),
            SizedBox(
              height: screenHeight * 1 / 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: leftalign),
                    child: InkWell(
                      child: Icon(Icons.menu, color: Colors.white),
                      onTap: onMenuTap,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: leftalign),
                      child: Icon(Icons.settings, color: Colors.white)),
                ],
              ),
            ),
            //Spacer(flex: 3),
            Container(
                height: screenHeight * 1 / 20,
                margin: EdgeInsets.only(left: leftalign),
                child: FittedBox(
                  child: Text("Hello $FirstName",
                      style: TextStyle(
                        fontFamily: font,
                        fontWeight: fontWeightBold,
                        letterSpacing: letterSpacingSmall,
                        color: kMain_HeadingTextColor,
                      )),
                )),

            Container(
              height: screenHeight * 1 / 15,
              child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: kMain_ScrollTextColorOnPress,
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.only(left: leftalign, right: leftalign),
                  unselectedLabelColor: kMain_ScrollTextColor,
                  tabs: [
                    Tab(
                      child: Container(
                        height: screenHeight * 1 / 30,
                        child: FittedBox(
                          child: Text('Events',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: fontWeightSemiBold,
                              )),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: screenHeight * 1 / 30,
                        child: FittedBox(
                          child: Text('Tutoring',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: fontWeightSemiBold,
                              )),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: screenHeight * 1 / 30,
                        child: FittedBox(
                          child: Text('Student Orgs',
                              style: TextStyle(
                                fontFamily: font,
                                fontWeight: fontWeightSemiBold,
                              )),
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(height: screenHeight * 1 / 60),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                  height: screenHeight * 23 / 30,
                  width: double.infinity,
                  child: TabBarView(controller: _tabController, children: [
                    Events1Swipe(leftAlign: leftalign),
                    TutoringSwipe(),
                    StudentOrgSwipe(),
                  ])),
            )
          ],
        ),
      ),
    ));
  }
}
