import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wandr_frontend/model/login_model.dart';
import 'package:wandr_frontend/strings.dart';

class APILogin {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
    String url = "https://wandr.lesch.dev/api/login";
    final response = await http.post(url, body: loginRequestModel.toJson());
    if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Faild to load Data');
    }
  }
}