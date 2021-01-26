import 'package:coe_mobile_app/api/tutoring_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coe_mobile_app/constants/fonts.dart';
import 'package:coe_mobile_app/Objects/TutoredCourse.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:coe_mobile_app/custom_expansion_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/notifier/hkn_notifier.dart';


class HKNPage extends StatefulWidget {
  @override
  _HKNPageState createState() => _HKNPageState();
}

class _HKNPageState extends State<HKNPage> {
  TextEditingController _controller;
  List<TutoredCourse> _courseFullList;
  List<TutoredCourse> _filteredCourseList = [];
  bool oneTimePass = true;
  Color textCol;
  double screenWidth, screenHeight, leftalign;

  @override
  void initState() {
    HknNotifier hknNotifier = Provider.of<HknNotifier>(context, listen: false);
    getTutoredCourse(hknNotifier);
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("hkn_data_test")
        .document("ECE 111")
        .collection("Monday")
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
  }

  @override
  Widget buildList2(int index) {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(left: 30.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Monday", style: kHknPage_DayTextStyle),
            for (int i = 0; i < _courseFullList[index].mondayList.length; i++)
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth*1/3,
                        child: Text(_filteredCourseList[index].mondayList[i].time,
                            style: kHknPage_tutorTextStyle),
                      ),
                      Text(_filteredCourseList[index].mondayList[i].name,
                          style: kHknPage_tutorTextStyle)
                    ]),
              ),

            Padding(
              padding: EdgeInsets.only(top: 10.0),
                child: Text("Thursday", style: kHknPage_DayTextStyle)),
            for (int t = 0;
                t < _filteredCourseList[index].thursdayList.length;
                t++)
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(children: <Widget>[
                  SizedBox(
                    width: screenWidth*1/3,
                    child: Text(_filteredCourseList[index].thursdayList[t].time,
                        style: kHknPage_tutorTextStyle),
                  ),
                  Text(_filteredCourseList[index].thursdayList[t].name,
                      style: kHknPage_tutorTextStyle)
                ]),
              )
          ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    double leftalign = screenWidth * 1 / 25;

    HknNotifier hknNotifier = Provider.of<HknNotifier>(context);
    _courseFullList = hknNotifier.hknList;
    oneTimePass
        ? (_filteredCourseList = _courseFullList)
        : (_filteredCourseList = _filteredCourseList);
    if (_courseFullList.length > 0) {
      oneTimePass = false;
    } else
      oneTimePass = true;

    //print(_courseFullList.length);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  kHkn_gradient1,
                  kHkn_gradient2,
                ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40, top: 55, right: 20),
                child: Text("Courses",
                    style: TextStyle(
                      fontFamily: font,
                      fontWeight: fontWeightBold,
                      fontSize: fontSizeMedHeading,
                      letterSpacing: letterSpacingSmall,
                      color: kHkn_CourseTitleColor,
                    )),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(8, 50, 8, 0),
                          child: TextField(
                              keyboardType: TextInputType.text,
                              controller: _controller,
                              decoration: InputDecoration(
                                  labelText: "Search",
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)))),
                              onChanged: (string) {
                                setState(() {
                                  _filteredCourseList = _courseFullList
                                      .where((u) => (u.coursename
                                          .toLowerCase()
                                          .contains(string.toLowerCase())))
                                      .toList();
                                });
                              })),
                      Flexible(child: buildList(context))
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  ListView buildList(BuildContext context) {
    //print("Monday 1 is"); print (_filteredCourseList[0].mondayList.length);
    //print("Monday 2 is"); print (_filteredCourseList[1].mondayList[0].name);
    //print("Monday 3 is"); print (_filteredCourseList[2].mondayList.length);
    //getDocs();
    print(_filteredCourseList.length);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        itemCount: _filteredCourseList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index % 2 == 0)
            textCol = kHkn_Listcolorgreen;
          else
            textCol = kHkn_Listcolororange;
          return CustomExpansionTile(
              tilePadding: EdgeInsets.only(top: 0.0, bottom:0.0),
              //contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              leading: Text(_filteredCourseList[index].coursecode,
                  style: TextStyle(
                      fontFamily: font,
                      fontWeight: fontWeightMedium,
                      fontSize: fontSizeText,
                      color: textCol)),
              title: Text(_filteredCourseList[index].coursename,
                  style: TextStyle(
                      fontFamily: font,
                      fontWeight: fontWeightSemiBold,
                      fontSize: fontSizeText)),
              children: <Widget>[Container(child: buildList2(index))]);
        });
  }
}
