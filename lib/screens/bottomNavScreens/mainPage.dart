import 'package:electra_link/screens/authentication/authenticationWidgets.dart';
import 'package:electra_link/utils/constants.dart';
import 'package:electra_link/utils/widgets/carousalSliders/ImageCarousalWidget.dart';
import 'package:electra_link/utils/widgets/carousalSliders/iconCarousalWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MainPage extends StatefulWidget {
  final Function? onMapFunction;
  const MainPage({Key? key, this.onMapFunction}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kDarkGreenColor,
        title: Text(
          "ElectraLink",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontFamily: "MontserratBold", fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(20),
                    width: AppConstants.screenWidth(context) * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img2.jpeg"),
                        //todo: change it to image you'll be getting
                      ),
                    ),
                  ),


                ),
                IconCarousel(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.screenWidth(context) * 0.05),
                  child: Container(
                    height: AppConstants.screenHeight(context) * 0.35,
                    width: AppConstants.screenWidth(context) * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kDarkGreenColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mapLocationDot,
                          size: 80,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Share Your Location to view nearby stations ",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RoundedElevatedButton("LAUNCH MAP", kPrimaryColor, () {
                          MapsLauncher.launchQuery(
                              'Nearest Electric charging station with distance by car');
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ImageCarousel(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
