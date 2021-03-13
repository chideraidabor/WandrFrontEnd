// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wandr_frontend/strings.dart';
// import 'package:http/http.dart' as http;
// import 'package:wandr_frontend/views/tabs/search.dart';
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//
//   bool _isLoading = false;
//
//   signIn(String email, String password) async {
//     String loginUrl = Strings.wandr_url+"/login";
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     Map body = {"Email" : email, "Password" : password};
//     var jsonResponse;
//     var response = await http.post(loginUrl, body: body);
//     //Need to check the api status
//     if(response.statusCode == 200){
//       jsonResponse = json.decode(response.body);
//
//       print("Response status: ${response.statusCode}");
//       print("Response status: ${response.body}");
//
//       if(jsonResponse != null){
//         // setState(() {
//         //   _isLoading = false;
//         // });
//         sharedPreferences.setString("token", jsonResponse['token']);
//         // Navigator.of(context).pushAndRemoveUntil
//         //   (MaterialPageRoute(builder: (BuildContext context)
//         // => searchPage()), (Route<dynamic> route) => false);
//       }
//     }else{
//       // setState(() {
//       //   _isLoading = false;
//       // });
//       print("Response status: ${response.body}");
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
