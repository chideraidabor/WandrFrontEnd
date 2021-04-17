import 'package:flutter/material.dart';
import 'package:wandr_frontend/views/widgets/already_have_an_account_acheck.dart';
import 'package:wandr_frontend/views/widgets/rounded_button.dart';
import 'package:wandr_frontend/views/widgets/rounded_input_field.dart';
import 'package:wandr_frontend/views/widgets/rounded_password_field.dart';
import 'package:wandr_frontend/views/widgets/signupBackground.dart';
import 'login_screen.dart';


class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SignupBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Full Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
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
