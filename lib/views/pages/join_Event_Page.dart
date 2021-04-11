import 'package:flutter/material.dart';

class JoinEventPage extends StatefulWidget {
  //JoinEventPage({Key key}) : super(key: key);
  JoinEventPage();
  @override
  _JoinEventPageState createState() => _JoinEventPageState();
}

class _JoinEventPageState extends State<JoinEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(child: Text("JOIN PAGE")),
          color: Colors.white,
        ));
  }
}
