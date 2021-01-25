import 'package:coe_mobile_app/Objects/TutoringResource.dart';
import 'package:flutter/material.dart';
import 'package:coe_mobile_app/constants/CustomIcons.dart';


//This is the main area where we parameterize the data for the Tutoring Pages
//This follows the hierarchy and uses a map.

class Tutoring_DataMap{
  static final Map<String, TutoringResource> dataMap = {
    'SWE':
      TutoringResource(
        Name: "Society of Women Engineers",
        Description: "Society of Women Engineers hosts open zoom rooms each week with tutors for physics, calculus, intro to programming, intro to matlab, and other intro classes. ",
        gradient1:Color.fromRGBO(188, 72, 222, 91),
        gradient2: Color.fromRGBO(255, 95, 170, 99),
        Icon_data: CustomIcons.swe,
        RequestTutoring: 'https://docs.google.com/forms/d/e/1FAIpQLSd2ylYAwB3rED0WF93-JXeFnYGOCtzNzpac-8XsW4a6fInzEg/viewform',
        ViewSchedule: null,
      Zoomlink: null),

    'HKN':
      TutoringResource(
        Name: "Eta Kappa Nu Honor Society",
        Description: "Eta Kappa Nu members provide coverage for ECE classes through junior year level as well as intro PHY courses. They are hosting virtual office hour style over Zoom.",
        gradient1:Color.fromRGBO(19, 237, 124, 100),
        gradient2: Color.fromRGBO(14, 161, 172, 49),
        Icon_data: Icons.offline_bolt,
          RequestTutoring: null,
          Zoomlink: null,
        ViewSchedule: 'https://35dde155-6114-4c73-b11b-8d4a6bf5e996.filesusr.com/ugd/c8f1ca_d86573aa7a8643b9b4c540250e583242.pdf',),

    'ASCE':
      TutoringResource(
          Name: "American Society of Civil Engineers",
          Description: "American Society of Civil Engineers is  hosting tutoring sessions for civil and architectural course. ",
          gradient1: Color.fromRGBO(31, 1, 252, 100),
          gradient2: Color.fromRGBO(127, 185, 245, 100),
          Icon_data: Icons.content_cut,
          RequestTutoring: null,
        Zoomlink: null,
          ViewSchedule: 'https://calendly.com/umasce)',),

    'MATH':
      TutoringResource(
          Name: "Math Lab",
          Description: "The Math Lab provides tutoring to any student enrolled in an undergraduate math course at the University of Miami. Tutoring is available on a walk-in basis. The Math Lab is staffed by mathematics graduate students and undergraduate peer tutors with a Math major or minor.",
          gradient1: Color.fromRGBO(219, 4, 26, 91),
          gradient2: Color.fromRGBO(238, 53, 0, 53),
          Icon_data: CustomIcons.math,
          RequestTutoring: null,
          Zoomlink: null,
        ViewSchedule: 'https://www.math.miami.edu/resources/math-laboratory/',),

    'PHYSICS':
      TutoringResource(
          Name: "Physics Academy",
          Description: "Need HELP with Physics? Physics academy is hosting with online Zoom Session",
          gradient1: Color.fromRGBO(247, 174, 5, 69),
          gradient2: Color.fromRGBO(247, 174, 5, 69),
          Icon_data: CustomIcons.physics,
          RequestTutoring: null,
          Zoomlink: null,
          ViewSchedule: 'https://physics.as.miami.edu/undergraduate-program/current-students/index.html'),

    'CAMNER':
      TutoringResource(
          Name: "Camner Center",
          Description: "The Peer Tutoring Program at the Camner Center for Academic Resources offers students support in achieving their academic goals. The program currently has over 100 peer tutors knowledgeable in various subjects, both undergraduate and graduate, working to help fellow students with reaching their academic goals.",
          gradient1: Color.fromRGBO(253, 71, 46, 100),
          gradient2: Color.fromRGBO(247, 174, 5, 69),
          Icon_data: CustomIcons.miami_hurricanes_logo,
          RequestTutoring: null,
          Zoomlink: null,
          ViewSchedule: 'https://camnercenter.miami.edu/tutoring-services/index.html)'),
  };
}
