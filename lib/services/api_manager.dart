import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/model/CitiesInfo.dart';
import 'package:wandr_frontend/model/EventInfo.dart';
import 'package:wandr_frontend/strings.dart';
import 'package:wandr_frontend/services/loginAPI.dart';

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
      return List<PlaceInfo>.from(l.map((e) => PlaceInfo.fromJson(e)));
    } else {
      throw Exception("Failed to Load PlaceInfo");
    }
  }

  Future<List<EventItem>> getEvents() async {
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
      return List<EventItem>.from(l.map((e) => EventItem.fromJson(e)));
    } else {
      throw Exception("Failed to Load EventInfo");
    }
  }
}
