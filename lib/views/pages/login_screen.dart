import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/login_model.dart';
import 'package:wandr_frontend/routes.dart';
import 'package:wandr_frontend/services/loginAPI.dart';
import 'package:wandr_frontend/views/pages/homePage.dart';
import 'package:wandr_frontend/views/pages/signup_screen.dart';
import 'package:wandr_frontend/views/widgets/already_have_an_account_acheck.dart';
import 'package:wandr_frontend/views/widgets/loginBackground.dart';
import 'package:wandr_frontend/views/widgets/rounded_button.dart';
import 'package:wandr_frontend/views/widgets/rounded_input_field.dart';
import 'package:wandr_frontend/views/widgets/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRequestModel requestModel = new LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  requestModel.email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  requestModel.password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  if (requestModel.email == null ||
                      requestModel.password == null) {
                    print("password or email is null");
                    return;
                  }
                  print(requestModel.email);
                  var loginResponse = await LoginAPI()
                      .logIn(requestModel.email, requestModel.password);
                  if (loginResponse) {
                    Navigator.pushNamed(context, WandrRoutes.home);
                  } else {
                    print("Login invalid");
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
