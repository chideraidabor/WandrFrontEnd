import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/model/userEventInfo.dart';
import 'package:wandr_frontend/services/apiManager.dart';

import '../../model/EventInfo.dart';

class EventTab extends StatefulWidget {
  @override
  _EventTabState createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  double deviceHeight;
  double deviceWidth;
  List<Eventitem> events = [];
  List<PlaceInfo> places = [];
  List<UserEventInfo> userEvents = [];
  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    await API_Manager().getUserEvent(context).then((value) {
      userEvents = value;
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
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
                      child: Container(
                    child: userEvents.length == 0
                        ? Center(child: Text("You have no events"))
                        : eventListBuilder(),
                  ))
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

  ListView eventListBuilder() {
    return ListView.builder(
        itemCount: userEvents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400],
                    boxShadow: kElevationToShadow[3]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userEvents[index].eventTitle,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(userEvents[index].location),
                              )
                            ],
                          ),
                          Text(DateFormat.jm()
                              .format(userEvents[index].eventStartTime)),
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
