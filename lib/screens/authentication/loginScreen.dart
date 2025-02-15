
import 'package:electra_link/screens/authentication/signupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'authenticationWidgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool showSpinner = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: AppConstants.screenHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Hero(
                    tag: 'background',
                    child: Container(
                      width: AppConstants.screenWidth(context) * 0.2,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/loginBackground.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "ElectraLink",
                      style: TextStyle(
                          fontFamily: "DancingScriptBold",
                          fontSize: 30,
                          color: kPrimaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context) * 0.08,
                ),
                Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: "MontserratBold",
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context) * 0.05,
                ),
                Container(
                  width: AppConstants.screenWidth(context) * 0.75,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.black,
                          fontFamily: "MontserratBold",),
                        textAlign: TextAlign.center,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter Your Email",
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.screenHeight(context) * 0.025,
                      ),
                      TextFormField( obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        style:TextStyle(color: Colors.black,
                          fontFamily: "MontserratBold",),
                        textAlign: TextAlign.center,
                        controller: passwordController,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter Your Password",
                        ),
                      ),

                      SizedBox(
                        height: AppConstants.screenHeight(context) * 0.025,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: AppConstants.screenWidth(context) * 0.75,
                  height: AppConstants.screenHeight(context) * 0.08,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: RoundedElevatedButton("Login", kPrimaryColor, () async {
                      setState(() {
                        showSpinner = true;
                      });

                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email!, password: password!);

                        Navigator.pushNamedAndRemoveUntil(
                            context, "home", (route) => false);
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);

                        setState(() {
                          showSpinner = false;
                        });

                        String errorMessage =
                            "An error occurred. Please try again.";

                        if (e is FirebaseAuthException) {
                          errorMessage = e.message!;
                        }

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text(errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );};
                    },),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                LoginSignupAnotherWay(
                    "New around here?", Colors.grey, "Signup", kPrimaryColor,
                        () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => SignupScreen()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
