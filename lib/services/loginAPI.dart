import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandr_frontend/strings.dart';

class Login  {

  signIn(String email, String password) async {
    String loginUrl = Strings.wandr_url+"/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = {"Email" : email, "Password" : password};
    var jsonResponse;
    var response = await http.post(loginUrl, body: body);
    //Need to check the api status
    if(response.statusCode == 200){
      jsonResponse = json.decode(response.body);

      print("Response status: ${response.statusCode}");
      print("Response status: ${response.body}");

      if(jsonResponse != null){
        
      }


    }
  }


}
