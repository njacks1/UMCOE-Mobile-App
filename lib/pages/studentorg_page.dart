import 'package:coe_mobile_app/Objects/StudentOrg.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

class StudentOrgPage extends StatelessWidget {
  final StudentOrg Org;

  StudentOrgPage({Key key, @required this.Org}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double ScreenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double leftalign = ScreenWidth * 1 / 25;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration(
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
            SizedBox(height: ScreenHeight * 7 / 30),
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  child: Container(
                    height: ScreenHeight * 23 / 30,
                    color: kOrg_Background,
                    padding: EdgeInsets.only(top: 70.0, left: leftalign),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20.0, right: leftalign),
                              child: Text(Org.name,
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: fontWeightSemiBold,
                                      fontSize: fontSizeTitle)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20.0, right: leftalign),
                              child: Text(Org.description,
                                  style: TextStyle(
                                      fontFamily: font,
                                      fontWeight: fontWeightMediumLight,
                                      fontSize: fontSizeText)),
                            ),
                            if (Org.chat != null)
                              Padding(
                                padding:
                                EdgeInsets.fromLTRB(0, 15.0, 10.0, 15.0),
                                child: SizedBox(
                                  width: 150,
                                  child: RaisedButton(
                                      color: kOrg_ChatButtonColor,
                                      child: Text("Join Chat",
                                          style: TextStyle(
                                              fontFamily: font,
                                              fontWeight: fontWeightDemiBold,
                                              fontSize: fontSizeMajorText,
                                              color: kOrg_ButtonTextColor)),
                                      onPressed: () async {
                                        if (await canLaunch(Org.chat)) {
                                          await launch(Org.chat);
                                        }
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)))),
                                ),
                              ),
                            Row(
                              children: [
                                if (Org.website != null)
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, 15.0, 30.0, 30.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: RaisedButton(
                                          color: kOrg_WebsiteButtonColor,
                                          child: Text("Website",
                                              style: TextStyle(
                                                  fontFamily: font,
                                                  fontWeight: fontWeightDemiBold,
                                                  fontSize: fontSizeMajorText,
                                                  color: kOrg_ButtonTextColor)),
                                          onPressed: () async {
                                            if (await canLaunch(Org.website)) {
                                              await launch(Org.website);
                                            }
                                          },
                                          padding: EdgeInsets.all(15.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0)))),
                                    ),
                                  ),
                                if (Org.email != null)
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, 15.0, 30.0, 30.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: RaisedButton(
                                          color: kOrg_EmailButtonColor,
                                          child: Text("Email",
                                              style: TextStyle(
                                                  fontFamily: font,
                                                  fontWeight: fontWeightDemiBold,
                                                  fontSize: fontSizeMajorText,
                                                  color: kOrg_ButtonTextColor)),
                                          onPressed: () => {},
                                          padding: EdgeInsets.all(15.0),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12.0)))),
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              children: [
                                if (Org.facebook != null)
                                  IconButton(
                                    icon: Image.asset(
                                        'images/socialmedia_icons/facebook_logo.png'),
                                    iconSize: 50,
                                    onPressed: () async {
                                      if (await canLaunch(Org.facebook)) {
                                        await launch(Org.facebook);
                                      }
                                    },
                                  ),
                                if (Org.instagram != null)
                                  IconButton(
                                    icon: Image.asset(
                                        'images/socialmedia_icons/instagram_logo.png'),
                                    iconSize: 50,
                                    onPressed: () async {
                                      if (await canLaunch(Org.instagram)) {
                                        await launch(Org.instagram);
                                      }
                                    },
                                  ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  top: -100,
                  left: 100,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(Org.image),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          )
                        ]),
                    width: 200.0,
                    height: 150.0,
                  ),
                )
              ],
              overflow: Overflow.visible,
            )
          ],
        ),
      ),
    );
  }
}
