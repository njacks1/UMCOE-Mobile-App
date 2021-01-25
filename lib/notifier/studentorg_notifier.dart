import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:coe_mobile_app/Objects/StudentOrg.dart';

class StudentOrgNotifier with ChangeNotifier {
  List<StudentOrg> _studentOrgList = [];
  StudentOrg _currentStudentOrg;

  UnmodifiableListView <StudentOrg> get studentOrgList => UnmodifiableListView(_studentOrgList);

  StudentOrg get currentStudentOrg => _currentStudentOrg;

  set studentOrgList(List<StudentOrg> studentOrgList){
    _studentOrgList = studentOrgList;
    notifyListeners();
  }

  set currentStudentOrg( StudentOrg studentOrg){
    _currentStudentOrg = studentOrg;
    notifyListeners();
  }

}