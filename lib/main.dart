import 'package:flutter/material.dart';
import 'package:wandr_frontend/views/home.dart';
import 'package:wandr_frontend/views/tabs/search.dart';
import 'package:wandr_frontend/views/pages/Calendar.dart';
import 'package:wandr_frontend/views/pages/newCalendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: Home(),
      home: NewCalendar(),
    );
  }
}
