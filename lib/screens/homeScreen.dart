import 'package:electra_link/screens/authentication/authenticationWidgets.dart';
import 'package:electra_link/screens/bottomNavScreens/evMarket.dart';
import 'package:electra_link/utils/constants.dart';
import 'package:electra_link/utils/widgets/carousalSliders/IconCarousals/iconCarousalWidget1.dart';
import 'package:electra_link/utils/widgets/evScoopsWidget/evScoopsWidget.dart';
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
                  onTap: () {
                    //todo navigate to EV Scoops page
                  },
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
                        image: AssetImage("assets/images/mainPagePhoto1.jpg"),
                      ),
                    ),
                  ),
                ),
                IconCarousel1(),
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
                        RoundedElevatedButton("Plan Journey", kPrimaryColor,
                              () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController textController1 =
                                TextEditingController();
                                TextEditingController textController2 =
                                TextEditingController();
                                TextEditingController textController3 =
                                TextEditingController();
                                return AlertDialog(
                                  backgroundColor: kDarkGreenColor,
                                  surfaceTintColor: Colors.transparent,
                                  title: Text('Enter Journey Details'),
                                  content: Container(
                                    height: 150,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: textController1,
                                          decoration: InputDecoration(labelText: 'Source'),
                                        ),
                                        TextField(
                                          controller: textController2,
                                          decoration: InputDecoration(labelText: 'Destination'),
                                        ),
                                        // TextField(
                                        //   controller: textController3,
                                        //   decoration: InputDecoration(labelText: 'Charging Remaining(in KMs)'),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                          MapsLauncher.launchQuery(
                                              // "find locations with Level 3 EV chargers along route from ${textController1.text} to ${textController2.text} with distance"
                                              "find locations with Level 3 EV chargers along route from ${textController1.text} to ${textController2.text} with car"
                                          );

                                        print('Field 1: ${textController1.text}');
                                        print('Field 2: ${textController2.text}');
                                        print('Field 3: ${textController3.text}');
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        //         () {
                        //   MapsLauncher.launchQuery(
                        //       'Nearest Electric charging station with distance by car');
                        // }
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RoundedElevatedButton("Launch Map", kPrimaryColor,

                                  () {
                            MapsLauncher.launchQuery(
                                'Nearest Electric charging station with distance by car');
                          }
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context, "addVehicle", );
              },
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
                    image: AssetImage("assets/images/carousalImage1.jpg"),
                  ),
                ),
              ),
            ),
            Container(
              color: kDarkGreenColor,
              height: AppConstants.screenHeight(context) * 0.40,
              width: AppConstants.screenWidth(context),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: AppConstants.screenWidth(context) - AppConstants.screenWidth(context)*0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EV SCOOPS",
                            style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  EVMarketPage()),
                            );
                            },
                            child: Text(
                              "View all >>",
                              style: TextStyle(
                                fontFamily: "MontserratSemiBold",
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:
                      EVScoopsHomeList(context),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
