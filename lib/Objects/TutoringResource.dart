import 'package:flutter/material.dart';

class TutoringResource {
  final String Name;
  final String Description;
  final String RequestTutoring;
  final String ViewSchedule;
  final String Zoomlink;
  final Color gradient1;
  final Color gradient2;
  final IconData Icon_data;

  TutoringResource(
      {@required this.Name,
      @required this.Description,
      this.RequestTutoring,
      this.Zoomlink,
      @required this.gradient1,
      @required this.gradient2,
      @required this.Icon_data,
      this.ViewSchedule});
}
