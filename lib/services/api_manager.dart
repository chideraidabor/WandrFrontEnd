import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/model/placeInfo.dart';
import 'package:wandr_frontend/strings.dart';
import 'package:wandr_frontend/services/loginAPI.dart';

class API_Manager {

  Future<List<PlaceInfo>> getPlace(String place) async{
    String token;
    LoginAPI().getToken().then((value)  {
      token = value;
    });

    LoginAPI().logIn("hanzomain@gmail.com", "q1w2e3r4");
    final response = await http.get(Strings.wandr_url + "/places/search?q=$place", headers: {
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      });
    if(response.statusCode == 200){
      Iterable l = jsonDecode(response.body);
      return List<PlaceInfo>.from(l.map((e) => PlaceInfo.fromJson(e)));
    }else{
      throw Exception("Failed to Load PlaceInfo");
    }
  }

}





// String email = "hanzomain@gmail.com" ;
// String password = "q1w2e3r4";
// //   Map body = {"Email" : email, "Password" : password};
//
// LoginAPI().signIn(email, password);
// String token;
// LoginAPI().getToken().then((value) {
// token = value;
// });
// final response = await http.get(Strings.wandr_url + "/places/search?q=$place", headers: {
// 'Content-Type': 'application/json',
// 'accept': 'application/json',
// 'Authorization': 'Bearer $token',
// });
// print('Token : $token');
// print(response);
// if(response.statusCode == 200){
// Iterable l = jsonDecode(response.body);
// return List<PlaceInfo>.from(l.map((e) => PlaceInfo.fromJson(e)));
// }else{
// throw Exception("Failed to Load PlaceInfo");
// }
// }


