import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/eventInfo.dart';
import 'package:wandr_frontend/services/apiManager.dart';

class NewCalendarPage extends StatefulWidget {
  NewCalendarPage({Key key}) : super(key: key);

  @override
  _NewCalendarPageState createState() => _NewCalendarPageState();
}

class _NewCalendarPageState extends State<NewCalendarPage> {
  double deviceHeight;
  double deviceWidth;
  var allEvents;
  List<Map<String, dynamic>> listOfDate = [];

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
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
                  Icon(Icons.subdirectory_arrow_left),
                  Icon(Icons.arrow_forward),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: listOfDate
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '${e["time"].hour}:${e["time"].minute == 0 ? "00" : e["time"].minute}'),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  width: 300,
                                                  height: 10,
                                                  color: Colors.grey),
                                            ),
                                            e["event"] != ""
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.pink,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        width: 100,
                                                        child: Text(
                                                          e["event"],
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                  )
                                                : SizedBox.shrink(),
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
    ));
  }

  void getData() async {
    List<EventItem> data = await API_Manager().getEvents();

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
