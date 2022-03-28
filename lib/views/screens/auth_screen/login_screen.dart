import 'package:flutter/material.dart';
import 'package:tiktok_clone/constant/constant.dart';
import 'package:tiktok_clone/views/helping_widgets/text_input_field.dart';
import 'package:tiktok_clone/views/screens/auth_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Tiktok Clone",
            style: TextStyle(
              fontSize: 35,
              color: buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextInputField(
              controller: _passwordController,
              labelText: "Password",
              icon: Icons.lock,
              isObsecure: true,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => authController.loginUser(
                _emailController.text, _passwordController.text),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don\'t have an account? ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupScreen())),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
