import 'package:coe_mobile_app/DataMap/Tutoring_DataMap.dart';
import 'package:coe_mobile_app/componets/tutor_icon.dart';
import 'package:flutter/material.dart';

class TutoringSwipe extends StatelessWidget {
  List<Widget> buildChildrenList(BuildContext context) {
    List<tutor_icon> displayList = [];

    for (String category in Tutoring_DataMap.dataMap.keys) {
      tutor_icon T = tutor_icon(
        TR: Tutoring_DataMap.dataMap[category],
        acronym: category,
      );
      displayList.add(T);
    }
    return displayList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(60)),
              color: Colors.white),
          child: GridView.count(
              crossAxisCount: 2, children: buildChildrenList(context)),
        ),
      ), //
    );
  }
}
