
import 'package:electra_link/screens/authentication/signupScreen.dart';
import 'package:electra_link/screens/authentication/welcomeScreen.dart';
import 'package:electra_link/screens/homeScreen.dart';
import 'package:electra_link/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => WelcomeScreen(),
          "signup": (context) => SignupScreen(),
          "home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
