import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentOrg {
  String name;
  String description;
  String image;
  String chat;
  String website;
  String email;
  String instagram;
  String facebook;
  String pageRoute;

  StudentOrg();

  StudentOrg.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    image = data['image'];
    chat = data['chat'];
    website = data['website'];
    email = data['email'];
    instagram = data['instagram'];
    facebook = data['facebook'];
    pageRoute = data['pageRoute'];
  }
}
