import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coe_mobile_app/Objects/Event.dart';
import 'package:coe_mobile_app/api/event_api.dart';
import 'package:coe_mobile_app/componets/zoom_button.dart';
import 'package:coe_mobile_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coe_mobile_app/notifier/event_notifier.dart';
import 'package:coe_mobile_app/events_expansion_tile.dart';
import 'package:intl/intl.dart';


class Events1Swipe extends StatefulWidget {
  double leftAlign;

  Events1Swipe({this.leftAlign});

  @override
  _Event1SwipeState createState() => new _Event1SwipeState();
}

class _Event1SwipeState extends State<Events1Swipe> {
  TextEditingController _controller;
  List<Event> _eventsFullList;
  List<Event> _filteredEventsList = [];
  bool oneTimePass = true;

  @override
  void initState() {
    EventsNotifier eventsNotifier =
    Provider.of<EventsNotifier>(context, listen: false);
    getEvents(eventsNotifier);
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  String formatTimestamp(Timestamp timestamp) {
    var format = new DateFormat('MM/d'); // 'hh:mm' for hour & min
    return format.format(timestamp.toDate());
  }

  @override
  Widget build(BuildContext context) {
      EventsNotifier eventsNotifier = Provider.of<EventsNotifier>(context);
      _eventsFullList = eventsNotifier.eventsList;
      oneTimePass ? (_filteredEventsList = _eventsFullList) : (_filteredEventsList = _filteredEventsList);
      if(_eventsFullList.length>0){
        oneTimePass = false;
      }
      else oneTimePass = true;
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60), topRight: Radius.circular(60)),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 30.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (string) {
                    setState(() {
                      _filteredEventsList = _eventsFullList
                          .where((u) => (u.name
                          .toLowerCase()
                          .contains(string.toLowerCase())))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: widget.leftAlign),
                child:
                Text("Upcoming Events", style: kEventsPage_TitleTextStyle),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: _filteredEventsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: EventsExpansionTile(
                            title: Container(
                              child: Text(_filteredEventsList[index].name,
                                  style: kEventsPage_eventNameTextStyle),
                            ),
                            subtitle: Text(
                                _filteredEventsList[index].description,
                                style: kEventsPage_eventDescriptionTextStyle),
                            //String date = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
//                          trailing: Text( '$DateFormat.yMd().format(EventDataMap.dataMap[key].Date)',
//                              style: TextStyle(
//                                  fontFamily: "AvenirNext",
//                                  fontWeight: FontWeight.w700,
//                                  fontSize: 16)),
                            trailing: Text(
                                formatTimestamp(_filteredEventsList[index].date),
                                style: kEventsPage_eventDateTextStyle),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Time: ",
                                            style:
                                            kEventsPage_timeLabelTextStyle),
                                        Text(_filteredEventsList[index].time,
                                            style: kEventsPage_timeTextStyle),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(0, 15, 0, 30),
                                      child: zoom_button(
                                          hyperlink: _filteredEventsList[index]
                                              .zoomlink),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      );
                    }
                  //children: buildChildrenList(context)
                ),
              ),
            ],
          ),
          //
        ),
      ),
    );
  }
}
