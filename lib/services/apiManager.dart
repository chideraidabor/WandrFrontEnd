import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/model/citiesInfo.dart';

import 'package:wandr_frontend/strings.dart';
import 'package:wandr_frontend/services/loginAPI.dart';

import '../model/EventInfo.dart';

class API_Manager {
  Future<List<CityInfo>> getCity(String city) async {
    await LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
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
  }

  Future<List<PlaceInfo>> getPlace(String city) async {
    await LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
    String token = await LoginAPI().getToken();

    final response =
        await http.get(Strings.wandr_url + "/places/search?q=$city", headers: {
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
  }

  Future<List<Eventitem>> getEvents() async {
    await LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
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
  }

  Future<List<Eventitem>> getCertainEvent({int id}) async {
    await LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
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
      throw Exception("Failed to Load EventInfo");
    }
  }

  // Future<List<UserEventInfo>> getUserEvents() async {
  //   await LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
  //   String token = await LoginAPI().getToken();
  //   final response = await http.get(Strings.wandr_url + "/events/userId", headers: {
  //     'Content-Type': 'application/json',
  //     'accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });
  //   if (response.statusCode == 200) {
  //     Iterable l = jsonDecode(response.body);
  //     print("Response status: ${response.statusCode}");
  //     print("Response status: ${response.body}");
  //     return List<UserEventInfo>.from(l.map((e) => UserEventInfo.fromJson(e)));
  //   } else {
  //     throw Exception("Failed to Load UserEventInfo");
  //   }
  // }
}
