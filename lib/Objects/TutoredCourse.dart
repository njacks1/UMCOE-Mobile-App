import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tutor {
  String name;
  String time;

  tutor();

  tutor.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    time = data['time'];
  }
}


class TutoredCourse {
  String coursecode;
  String coursename;
  CollectionReference monday;
  CollectionReference thursday;
  List <tutor> mondayList = new List();
  List <tutor> thursdayList = new List();

  TutoredCourse();

  TutoredCourse.fromMap(Map<String, dynamic> data) {
    coursecode = data['coursecode'];
    coursename = data['coursename'];
    monday = data['monday'];
    thursday = data['thursday'];


    //monday = data['Monday'];
    //thursday= data['Thursday'];
  }
}
