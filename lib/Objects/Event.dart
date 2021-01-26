import 'package:cloud_firestore/cloud_firestore.dart';


class Event {
  String name;
  String description;
  String time;
  String zoomlink;
  Timestamp date;

  Event();

  Event.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    time = data['time'];
    zoomlink = data['zoomlink'];
    date = data['date'];

  }
}
