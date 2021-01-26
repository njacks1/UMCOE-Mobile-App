import 'package:coe_mobile_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:coe_mobile_app/bloc/navigation_bloc.dart';
import 'package:coe_mobile_app/constants/color_constant.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

/*
class UtilityBillsPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;
  final bool pushNoti = false;

  const UtilityBillsPage({Key key, this.onMenuTap}) : super(key: key);
  */


class SettingsPage extends StatefulWidget with NavigationStates {
  final Function onMenuTap;
  final bool pushNoti = false;

  const SettingsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState(onMenuTap);
}

class _SettingsPageState extends State<SettingsPage> {
  Function onMenuTap;
  _SettingsPageState(this.onMenuTap);
  bool darkMode = false;
  String Mode = "Off";

  bool pushNoti = false;
  String Noti = "Off";




  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: kSetting_BackgroundColor,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.menu, color: Colors.white),
                onTap: onMenuTap,
              ),
              Text("Settings",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              Icon(Icons.settings, color: Colors.white),
            ],
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        //image: DecorationImage(
                        //image: NetworkImage(avatars[1]),
                        //fit: BoxFit.cover,
                        //),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nick Jacks", style: kSettingPage_nameTextStyle),
                          Text(
                            "ECE",
                            style: kSettingPage_subfieldTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  title: Text("Languages", style: kSettingPage_fieldTextStyle),
                  subtitle: Text(
                    "English US",
                    style: TextStyle(
                        fontSize: fontSizeSubText,
                        color: kSetting_FieldSubColor),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Profile Settings",
                    style: kSettingPage_fieldTextStyle,
                  ),
                  subtitle: Text(
                    "Nick Jacks",
                    style: kSettingPage_subfieldTextStyle,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                SwitchListTile(
                    title: Text(
                      "Dark Mode",
                      style: kSettingPage_fieldTextStyle,
                    ),
                    subtitle:
                    Text(this.Mode,
                      style: kSettingPage_subfieldTextStyle,
                    ),
                    value: this.darkMode,
                    onChanged: (bool value ){
                      setState(() {
                        this.darkMode = value;
                        this.Mode = this.darkMode ? "On" : "Off";
                      });

                    }),

                SwitchListTile(
                    title: Text(
                      "Push Notifications",
                      style: kSettingPage_fieldTextStyle,
                    ),
                    subtitle: Text(
                      this.Noti,
                      style: kSettingPage_subfieldTextStyle,
                    ),
                    value: this.pushNoti,
                    onChanged: (bool value) {
                      setState(() {
                        this.pushNoti = value;
                        this.Noti = this.pushNoti ? "On" : "Off";
                      });
                    }),
                ListTile(
                  title: Text(
                    "Logout",
                    style: kSettingPage_fieldTextStyle,
                  ),
                  onTap: () { },
                ),
              ],
            ),
          ),
        ]));
  }
}

/*return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.blueAccent,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.menu, color: Colors.white),
                onTap: onMenuTap,
              ),
              Text("Settings", style: TextStyle(fontSize: 24, color: Colors.white)),
              Icon(Icons.settings, color: Colors.white),
            ],
          ),
        ],
      ),
    );*/
