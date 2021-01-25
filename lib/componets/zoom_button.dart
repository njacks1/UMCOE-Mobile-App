import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class zoom_button extends StatefulWidget {
  final String hyperlink;

  zoom_button({@required this.hyperlink});

  @override
  _zoom_buttonState createState() => _zoom_buttonState();
}

class _zoom_buttonState extends State<zoom_button> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        width: 200,
        height: 56,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/ZoomButton.png'), fit: BoxFit.fill),
        ),
      ),
      onPressed: () async {
        if (await canLaunch(this.widget.hyperlink)) {
          await launch(this.widget.hyperlink);
        }
      },
    );
  }
}
