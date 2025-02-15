
import 'package:electra_link/screens/authentication/loginScreen.dart';
import 'package:electra_link/screens/authentication/signupScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'authenticationWidgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Hero(
                tag: 'background',
                child: Container(
                  width: AppConstants.screenWidth(context) * 0.5,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/loginBackground.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  "ElectraLink",
                  style: TextStyle(
                      fontFamily: "DancingScriptBold",
                      fontSize: 50,
                      color: kPrimaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's Save Our Planet Together",
                  style: TextStyle(
                      fontFamily: "MontserratBold",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: AppConstants.screenHeight(context) * 0.15,
            ),
            Container(
              width: AppConstants.screenWidth(context) * 0.75,
              height: AppConstants.screenHeight(context) * 0.08,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: RoundedElevatedButton("Login", kPrimaryColor, () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            LoginSignupAnotherWay("New around here?", Colors.grey, "Signup", kPrimaryColor, () {

              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignupScreen()));
            })
          ],
        ),
      ),
    );
  }
}
