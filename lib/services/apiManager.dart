import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/model/citiesInfo.dart';
import 'package:wandr_frontend/model/userEventInfo.dart';

import 'package:wandr_frontend/strings.dart';
import 'package:wandr_frontend/services/loginAPI.dart';
import 'package:wandr_frontend/widgets/ios_alert.dart';

import '../model/EventInfo.dart';
import '../model/userEventInfo.dart';

class API_Manager {
  Future<List<CityInfo>> getCity(String city, BuildContext context) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");
      String token = await LoginAPI().getToken();
      final response =
          await http.get(Strings.wandr_url + "/cities/?q=$city", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        return List<CityInfo>.from(l.map((e) => CityInfo.fromJson(e)));
      } else {
        throw Exception("Failed to Load CityInfo");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      // print("Check your internet connection");
      return [];
    }
  }

  Future<List<PlaceInfo>> getPlace(String city, BuildContext context) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");
      String token = await LoginAPI().getToken();

      final response = await http
          .get(Strings.wandr_url + "/places/search?q=$city", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        // print (jsonResponse['data']['token']['token']);
        //print(json.decode(res.body).token);
        return List<PlaceInfo>.from(l.map((e) => PlaceInfo.fromJson(e)));
      } else {
        throw Exception("Failed to Load PlaceInfo");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      //print("Check your internet connection");
      return [];
    }
  }

  Future<List<Eventitem>> getEvents(BuildContext context) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");
      String token = await LoginAPI().getToken();
      final response = await http.get(Strings.wandr_url + "/events", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        return List<Eventitem>.from(l.map((e) => Eventitem.fromJson(e)));
      } else {
        throw Exception("Failed to Load EventInfo");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      //print("Check your internet connection");
      return [];
    }
  }

  Future<List<Eventitem>> getCertainEvent(
      {int id, BuildContext context}) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");
      String token = await LoginAPI().getToken();
      final response =
          await http.get(Strings.wandr_url + "/events/$id", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      List data = response.body == "" ? [] : [jsonDecode(response.body)];
      if (response.statusCode == 200) {
        Iterable l = data;
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        return List<Eventitem>.from(l.map((e) => Eventitem.fromJson(e)));
      } else {
        throw Exception("Failed to Load certain events");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      //print("Check your internet connection");
      return [];
    }
  }

  Future<List<UserEventInfo>> getUserEvent(BuildContext context) async {
    await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");

    String token = await LoginAPI().getToken();
    try {
      //print("getting data");
      final response =
          await http.get(Strings.wandr_url + "/user/joinedEvents/", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      List data = response.body == "" ? [] : [jsonDecode(response.body)];
      if (response.statusCode == 200) {
        Iterable l = data;
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        //return response.body;
        List<UserEventInfo> userEvent = [];
        for (var item in l.first) {
          userEvent.add(UserEventInfo.fromJson(item));
        }
        return userEvent;
        // return List<UserEventInfo>.from(l.first.map((e) => UserEventInfo.fromJson(e)));
      } else {
        throw Exception("Failed to Load Events of this specific user");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      return [];
    }
  }

  Future<List<PlaceInfo>> getCertainPlace(
      {int id, BuildContext context}) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");
      String token = await LoginAPI().getToken();
      final response =
          await http.get(Strings.wandr_url + "/places/$id", headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        return List<PlaceInfo>.from(l.map((e) => PlaceInfo.fromJson(e)));
      } else {
        throw Exception("Failed to Load certain place");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      return [];
    }
  }

  Future<List<Eventitem>> getDateOfEvents(
      {String id, String date, BuildContext context}) async {
    try {
      await LoginAPI().logIn("dvamain@gmail.com", "nerfthis!");

      String token = await LoginAPI().getToken();

      final response = await http
          .get(Strings.wandr_url + "/places/$id/events/bydate?date=$date",

              ///wandr.lesch.dev/places/1/events/bydate?date
              headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      List data = response.body == "" ? [] : [jsonDecode(response.body)];
      if (response.statusCode == 200) {
        Iterable l = data;
        print("Response status: ${response.statusCode}");
        print("Response status: ${response.body}");
        //return response.body;
        if (l.length == 1) {
          return [];
        }
        return List<Eventitem>.from(l.map((e) => Eventitem.fromJson(e)));
      } else {
        throw Exception("Failed to Load Events of this specific date");
      }
    } catch (e) {
      iosAlert(context: context, content: "Check your internet connection!");
      return [];
    }
  }
}
