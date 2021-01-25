import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:coe_mobile_app/constants/fonts.dart';




class studentorg_icon extends StatefulWidget {

  final String name;
  final String logo;
  final String route;

  studentorg_icon({this.name, this.logo, this.route});

  @override
  _studentorg_iconState createState() => _studentorg_iconState();
}

class _studentorg_iconState extends State<studentorg_icon> {
  @override

  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          height: 70.0,
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, this.widget.route);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  width: 10.0,
                  height: 10.0,
                  color: Colors.black,
                ),
                    Text(
                        this.widget.name,
                        style: TextStyle(
                            fontFamily: font1, fontWeight: fontWeightDemiBold, fontSize: fontSizeText)
                    ),
                  ],
                ),
            ),

          ),
        ),



    );
  }
}