import 'package:electra_link/utils/constants.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var kBlueColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Profile"),
        titleTextStyle: TextStyle(
            fontSize: 25,
            fontFamily: "Montserrat-Bold",
            fontWeight: FontWeight.bold
        ),
        backgroundColor: kDarkGreenColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              weight: 100,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage(
                        "assets/images/demoProfilePic.png",
                      ),
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Suraj Raghuvanshi", style: TextStyle(
                          fontFamily: "Montserrat-Bold", fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                      Text(
                        "suraj.raghuvanshi@vitbhopal.ac.in",style: TextStyle(
                          fontFamily: "Montserrat-Bold", fontSize: 15, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              ProfileWidget("Charge History", "Already have charged 12 times using our app", () {
              },),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: kDarkGreenColor,
              ),
              SizedBox(
                height: 5,
              ),
              ProfileWidget("Payment Methods", "Visa xx09", () {}),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: kDarkGreenColor,
              ),
              SizedBox(
                height: 5,
              ),
              ProfileWidget("Promocodes", "You've special promo codes", () {}),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: kDarkGreenColor,
              ),
              SizedBox(
                height: 5,
              ),
              ProfileWidget("My Reviews", "Reviewed 3 products", () {}),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 2,
                color: kDarkGreenColor,
              ),
              SizedBox(
                height: 5,
              ),
              ProfileWidget("Settings", "Notifications, Passwords", () {}),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                color: kDarkGreenColor,
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ProfileWidget(
      String title, String subTitle, void Function()? onPressed) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: "Montserrat-Bold", fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontFamily: "Montserrat-Bold", fontSize: 15, color: Colors.grey.shade300),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
