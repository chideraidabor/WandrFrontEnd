import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandr_frontend/strings.dart';

class LoginAPI {
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //print (prefs.getString('token'));
    return prefs.getString('token');
  }

  logIn(String email, String pass) async {
    // String accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjE1NDc1OTkzLCJleHAiOjE2MzEyNDM5OTN9.8ERgLqGcaHhoxTB_hVoYYvCY7_sgHUlsJBHAcXde2hM";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"Email": email, "Password": pass};
    var jsonResponse;
    String token = await getToken();

    var res = await http.post(Strings.wandr_url + "/login", body: body);

    // check the api status
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      setToken(jsonResponse['data']['token']['token']);
      //sharedPreferences.setString("token", jsonResponse['token']);
      return true;
    } else {
      print("Response status: ${res.body}");
      return false;
    }
  }
}
