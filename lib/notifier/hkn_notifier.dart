import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:coe_mobile_app/Objects/TutoredCourse.dart';

class HknNotifier with ChangeNotifier {
  List<TutoredCourse> _hknList = [];
  TutoredCourse _currentTutoredCourse;

  UnmodifiableListView <TutoredCourse> get hknList => UnmodifiableListView(_hknList);

  TutoredCourse get currentTutoredCourse => _currentTutoredCourse;

  set hknList(List<TutoredCourse> hknList){
    _hknList = hknList;
    notifyListeners();
  }

  set currentTutoredCourse( TutoredCourse tutoredCourse){
    _currentTutoredCourse = tutoredCourse;
    notifyListeners();
  }

}