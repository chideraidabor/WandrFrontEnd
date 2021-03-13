import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/services/loginAPI.dart';
import 'package:wandr_frontend/views/home.dart';

void main() {
  runApp(MyApp());
  //LoginAPI().signIn("hanzomain@gmail.com","q1w2e3r4");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   //LoginAPI.signIn("hanzomain@gmail.com","q1w2e3r4");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      searchEvent(),
    );
  }
}

