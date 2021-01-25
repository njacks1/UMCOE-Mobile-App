import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/Objects/Event.dart';
import 'package:coe_mobile_app/notifier/event_notifier.dart';

getEvents(EventsNotifier eventsNotifier) async{
  //TODO: Get Maisy to update her API to non-deprecated version
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('events_data').get();
  List <Event> _eventsList = [];
  snapshot.docs.forEach((document){
    Event event = Event.fromMap(document.data());
    _eventsList.add(event);
  });
  eventsNotifier.eventsList = _eventsList;
}