import 'package:flutter/material.dart';
import 'package:wandr_frontend/model/login_model.dart';
import 'package:wandr_frontend/views/pages/signup_screen.dart';
import 'package:wandr_frontend/views/widgets/already_have_an_account_acheck.dart';
import 'package:wandr_frontend/views/widgets/loginBackground.dart';
import 'package:wandr_frontend/views/widgets/rounded_button.dart';
import 'package:wandr_frontend/views/widgets/rounded_input_field.dart';
import 'package:wandr_frontend/views/widgets/rounded_password_field.dart';

class LoginScreen extends StatelessWidget {
  LoginRequestModel requestModel;

  @override
  void initState(){
    requestModel = new LoginRequestModel();
  }


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
                new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => requestModel.email = input,
                    validator: (input) => !input.contains("@")
                        ? "Email Address is not valid"
                        : null
                );
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  new TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => requestModel.password = input,
                      validator: (input) => input.length < 3
                          ? "Password must be more than 3 charcters"
                          : null
                  );

                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
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
