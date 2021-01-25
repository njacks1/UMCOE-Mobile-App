import 'package:coe_mobile_app/componets/header.dart';
import 'package:coe_mobile_app/Objects/TutoringResource.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coe_mobile_app/constants/fonts.dart';


class TutoringPage extends StatelessWidget {
  final TutoringResource resource;
  final String acronym;

  TutoringPage({Key key, @required this.resource, @required this.acronym}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double leftalign = ScreenWidth * 1 / 25;


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,  elevation: 0.0,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyHeader(
              textTop: acronym,
              textBottom: resource.Name,
              g1: resource.gradient1,
              g2: resource.gradient2,
            ),
            Container(
              padding: EdgeInsets.only(left: leftalign),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.0, right: leftalign),
                        child: Text("Tutoring",
                            style: TextStyle(
                                fontFamily: font,
                                fontWeight: fontWeightSemiBold,
                                fontSize: fontSizeTitle)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.0, right: leftalign),
                        child: Text(resource.Description,
                            style: TextStyle(
                                fontFamily: font,
                                fontWeight: fontWeightMediumLight,
                                fontSize: fontSizeText)),
                      ),
                      if (resource.RequestTutoring != null)
                        Padding(
                          padding:
                          EdgeInsets.fromLTRB(0, 15.0, 10.0, 15.0),
                          child: SizedBox(
                            width: 230,
                            child: RaisedButton(
                                color: resource.gradient1,
                                child: Text("Request Tutoring",
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontWeight: fontWeightDemiBold,
                                        fontSize: fontSizeMajorText,
                                        color: kOrg_ButtonTextColor)),
                                onPressed: () async {
                                  if (await canLaunch(resource.RequestTutoring)) {
                                    await launch(resource.RequestTutoring);
                                  }
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                          ),
                        ),
                      if (resource.ViewSchedule != null)
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 15.0, 30.0, 30.0),
                          child: SizedBox(
                            width: 230,
                            child: RaisedButton(
                                color: resource.gradient1,
                                child: Text("Website",
                                    style: TextStyle(
                                        fontFamily: font,
                                        fontWeight: fontWeightDemiBold,
                                        fontSize: fontSizeMajorText,
                                        color: kOrg_ButtonTextColor)),
                                onPressed: () async {
                                  if (await canLaunch(resource.ViewSchedule)) {
                                    await launch(resource.ViewSchedule);
                                  }
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                          ),
                        ),
                    ]),
              ),
            ),

          ],
        ),
      ),
    );
  }
}