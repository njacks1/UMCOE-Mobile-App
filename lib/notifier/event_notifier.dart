import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:coe_mobile_app/Objects/Event.dart';

class EventsNotifier with ChangeNotifier {
  List<Event> _eventsList = [];
  Event _currentEvents;

  UnmodifiableListView <Event> get eventsList => UnmodifiableListView(_eventsList);

  Event get currentEvents => _currentEvents;

  set eventsList(List<Event> eventsList){
    _eventsList = eventsList;
    notifyListeners();
  }

  set currentEvents(Event event){
    _currentEvents = event;
    notifyListeners();
  }

}