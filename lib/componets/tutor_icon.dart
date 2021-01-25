import 'package:coe_mobile_app/Objects/TutoringResource.dart';
import 'package:coe_mobile_app/pages/tutoring_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:coe_mobile_app/constants/fonts.dart';

class tutor_icon extends StatelessWidget {
  final TutoringResource TR;
  final String acronym;

  tutor_icon({Key key, @required this.TR, @required this.acronym})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [TR.gradient1, TR.gradient2],
            ),
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TutoringPage(
                    resource: TR,
                    acronym: acronym,
                  ),
                ),
              );
            },
            padding: const EdgeInsets.all(0.0),
            textColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(TR.Icon_data, size: 60.0, color: Colors.white),
                Text(acronym,
                    style: TextStyle(
                        fontFamily: font1,
                        fontWeight: fontWeightDemiBold,
                        fontSize: fontSizeSubHeadingSmall)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
