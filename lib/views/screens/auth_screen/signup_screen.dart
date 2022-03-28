import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/screens/auth_screen/login_screen.dart';

import '../../../constant/constant.dart';
import '../../helping_widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
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
              "Register",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      "https://png.pngitem.com/pimgs/s/421-4212341_default-avatar-svg-hd-png-download.png"),
                  backgroundColor: Colors.blue,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: buttonColor,
                      size: 30,
                    ),
                    onPressed: () {
                      authController.pickImage();
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextInputField(
                controller: _usernameController,
                labelText: "Username",
                icon: Icons.person,
              ),
            ),
            SizedBox(
              height: 15,
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
              height: 15,
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
              onTap: () => authController.registerUser(
                  _usernameController.text,
                  _emailController.text,
                  _passwordController.text,
                  authController.profilePhoto),
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
                  "Register",
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
                  "Already have an accourn? ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Text(
                    "Login",
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
      ),
    );
  }
}
