import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  final String textTop;
  final String textBottom;
  final Color g1;
  final Color g2;

  const MyHeader({Key key, this.textTop, this.textBottom, this.g1, this.g2})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
          padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                this.widget.g1,
                this.widget.g2,
              ],
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.widget.textTop,
                    style: TextStyle(
                      fontFamily: 'AvenirNext',
                      fontWeight: FontWeight.w800,
                      letterSpacing: -3.0,
                      fontSize: 46,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(right:10.0),
                  child: Text(this.widget.textBottom,
                      style: TextStyle(
                        fontFamily: 'AvenirNext',
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: Colors.black,
                      )),
                ),
              ])),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
