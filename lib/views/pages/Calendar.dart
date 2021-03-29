import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/EventInfo.dart';
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  String placeName;
  //String placeImage; (add to constructor)

  Calendar({this.placeName});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  double deviceHeight;
  double deviceWidth;
  //CalendarController _controller = new CalendarController();
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height / 5,
            ),
            Expanded(child: dailyCalendar()),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 7,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: Center(
                        child: Text("Back"),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                      child: Center(
                        child: Text("Next"),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }

  fullCalendar() {}

  Widget dailyCalendar() {
    return SfCalendar(
      //view: CalendarView.month,
      allowViewNavigation: true,
    );
  }

  List<EventItem> _getEvents() {}
}
