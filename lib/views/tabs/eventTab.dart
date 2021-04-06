import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/EventInfo.dart';
import 'package:wandr_frontend/model/placeInfo.dart';

class EventTab extends StatefulWidget {
  @override
  _EventTabState createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  double deviceHeight;
  double deviceWidth;
  List<EventItem> events = [];
  List<PlaceInfo> places = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Row(
            children: [title()],
          ),
        ),
        Expanded(
          child: eventBuilder(),
          //color: Colors.blue,
        )
      ],
    ));
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        "Your Events",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
      ),
    );
  }

  ListView eventBuilder() {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Text(places[index].name),
                Text(places[index].location),
              ],
            ),
          );
        });
  }
}
