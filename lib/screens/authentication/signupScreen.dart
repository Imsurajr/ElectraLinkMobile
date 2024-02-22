import 'package:electra_link/screens/authentication/loginScreen.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'authenticationWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  String? FName;
  String? LName;
  bool showSpinner = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
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
                  height: 20,
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
                  height: AppConstants.screenHeight(context) * 0.06,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                      fontFamily: "MontserratBold",
                      fontSize: 35,
                      color: Colors.black),
                ),
                SizedBox(
                  height: AppConstants.screenHeight(context) * 0.02,
                ),
                Container(
                  width: AppConstants.screenWidth(context) * 0.75,
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppConstants.screenHeight(context) * 0.025,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          FName = value;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MontserratBold",
                        ),
                        textAlign: TextAlign.center,
                        controller: fNameController,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter Your First Name",
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.screenHeight(context) * 0.025,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          LName = value;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MontserratBold",
                        ),
                        textAlign: TextAlign.center,
                        controller: lNameController,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Enter Your Last Name",
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.screenHeight(context) * 0.025,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MontserratBold",
                        ),
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
                      TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MontserratBold",
                        ),
                        textAlign: TextAlign.center,
                        controller: passwordController,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Create New Password",
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
                    child: RoundedElevatedButton("Sign Up", kPrimaryColor,
                            () async {
                          try {
                            setState(() {
                              showSpinner = true;
                            });

                            final newUser =
                            await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );

                            Navigator.pushNamedAndRemoveUntil(
                                context, "home", (route) => false);
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
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
                            );
                          }
                        }),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                LoginSignupAnotherWay("Already have an account?", Colors.grey,
                    "Login", kPrimaryColor, () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
