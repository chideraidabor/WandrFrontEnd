import 'package:flutter/material.dart';
import 'package:wandr_frontend/services/apiManager.dart';

class JoinEventPage extends StatefulWidget {
  //JoinEventPage({Key key}) : super(key: key);
  Map selectedData;
  int placeId;

  JoinEventPage({this.selectedData, this.placeId});

  @override
  _JoinEventPageState createState() => _JoinEventPageState();
}

class _JoinEventPageState extends State<JoinEventPage> {
  @override
  void initState() {
    print(widget.selectedData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: RaisedButton(
              color: Colors.amber,
              child: widget.selectedData["event"] == ""
                  ? Text("create event")
                  : Text(
                      "Join Event",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
              onPressed: () {
                DateTime date = widget.selectedData["time"];
                API_Manager().createEvent(
                  context,
                  "title",
                  date.toString(),
                  date.add(Duration(minutes: 30)).toString(),
                  widget.placeId.toString(),
                );
              },
            ),
          ),
        ));
  }
}
