class Event {
  String name;
  String description;
  String time;

  //DateTime date;
  String zoomlink;

  Event();

  Event.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    time = data['time'];
    //date = data['date'];
    zoomlink = data['zoomlink'];
  }
}
