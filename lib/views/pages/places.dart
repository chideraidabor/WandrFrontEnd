import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/services/apiManager.dart';
import 'package:wandr_frontend/services/loginAPI.dart';

class Place extends StatefulWidget {


  String name;
  Place(String name){
    this.name = name;
  }


  @override
  _PlaceState createState() => _PlaceState();


}

class _PlaceState extends State<Place> {
  List<PlaceInfo> places = [];


  @override
  Widget build(BuildContext context) {
//Future<Scaffold>
    thePlace(String text) async {
      var data = await API_Manager().getPlace(text, context);
      setState(() {
        print(data);
        places = data;
      });
    }
      return Scaffold(
        appBar: AppBar(
          title: Text("Places in _"),
        ),
        body: Container(
          child: new ListView.builder(

              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                      child: Column(
                        children: <Widget>[
                          Text(places[index].name),
                          Text(places[index].description),
                          Text(places[index].location)
                        ],
                      )
                  ),
                );
              }),
        ),
      );

  }

}

