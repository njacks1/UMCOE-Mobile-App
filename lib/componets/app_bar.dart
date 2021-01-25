import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: kDefaultPadding),
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/search.svg"),
        onPressed: () {},
      ),
    ],
  );
}
}