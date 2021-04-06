import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wandr_frontend/controllers/eventController.dart';
import 'package:wandr_frontend/model/EventInfo.dart';

class NewCalendarPage extends StatefulWidget {
  String placeName;
  NewCalendarPage({this.placeName});

  //NewCalendarPage({Key key}) : super(key: key);

  @override
  _NewCalendarPageState createState() => _NewCalendarPageState();
}

class _NewCalendarPageState extends State<NewCalendarPage> {
  double deviceHeight;
  double deviceWidth;
  var allEvents;
  List<Map<String, dynamic>> listOfDate = [];
  EventController eventController;

  List listOfPictures = [
    "https://blog.texasbar.com/files/2011/02/ConstanceMims1.jpg",
    "http://thenewcode.com/assets/images/thumbnails/sarah-parmenter.jpeg",
    "https://i.pinimg.com/originals/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvPqrVSlP4257woE3nieg7UZXU-XQEi_a1nQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWsGk0OBBtICyPdKd4FalMuKWFEpE5ZSQG6g&usqp=CAU",
    "https://pbs.twimg.com/profile_images/929936057885384704/HnSIbCf8.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    eventController = Provider.of<EventController>(context, listen: false);
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Consumer<EventController>(
      //cityContainer(context, index, eventController)
      // cityContainer(context, index, eventController)
      builder: (context, eventController, child) => Scaffold(
          body: eventController.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://h7f7z2r7.stackpathcdn.com/sites/default/files/images/articles/walmart2.jpg"))),
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      // color: Colors.red,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'MONDAY, FEB 24',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.arrow_left),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Icon(Icons.calendar_today),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'SELECT TIMES',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: listOfDate
                                            .map(
                                              (e) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      e["event"] != ""
                                                          ? MainAxisAlignment
                                                              .start
                                                          : MainAxisAlignment
                                                              .spaceBetween,
                                                  children: [
                                                    Text(
                                                        '${e["time"].hour}:${e["time"].minute == 0 ? "00" : e["time"].minute}'),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            //highlight
                                                            print(
                                                                "i clicked on the time slot");
                                                          },
                                                          child: Padding(
                                                            padding: e["event"] !=
                                                                    ""
                                                                ? EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            30)
                                                                : EdgeInsets
                                                                    .all(8.0),
                                                            child: e["event"] !=
                                                                    ""
                                                                ? Stack(
                                                                    children: List
                                                                        .generate(
                                                                    6,
                                                                    (index) =>
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: index *
                                                                            20.0,
                                                                      ),
                                                                      child:
                                                                          CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage(listOfPictures[Random().nextInt(listOfPictures.length)]),
                                                                        backgroundColor:
                                                                            Colors.green,
                                                                        radius:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ))
                                                                : Container(
                                                                    width: 300,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .grey),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ))),
                    Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey),
                                child: Center(
                                  child: Text("Back"),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey),
                                child: Center(
                                  child: Text("Next"),
                                ),
                              ),
                            ])),
                  ],
                )),
    );
  }

  void getData() async {
    List<EventItem> data = await eventController.getEventData();

    for (int i = 0; i < 30; i++) {
      listOfDate.add({
        "time": DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          8,
          0,
        ).add(
          Duration(minutes: 30 * i),
        ),
        "event": allotEvent(
          data,
          DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            8,
            0,
          ).add(
            Duration(minutes: 30 * i),
          ),
        ),
      });
    }
    print(listOfDate);
    setState(() {});
  }

  allotEvent(List<EventItem> data, DateTime time) {
    String title = "";
    data.forEach((element) {
      if (element.eventStartTime.hour == time.hour &&
          element.eventStartTime.minute == time.minute) {
        title = element.eventTitle;
      }
    });
    return title;
  }
}

// if(i%2==0){
//   return 1;
// }
// else{
//   return 0;
// }
