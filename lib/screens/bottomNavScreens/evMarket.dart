import 'package:electra_link/screens/authentication/authenticationWidgets.dart';
import 'package:electra_link/utils/constants.dart';
import 'package:electra_link/utils/widgets/carousalSliders/IconCarousals/iconCarousalWidget1.dart';
import 'package:electra_link/utils/widgets/evScoopsWidget/evScoopsWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class EVMarketPage extends StatefulWidget {
  final Function? onMapFunction;
  const EVMarketPage({Key? key, this.onMapFunction}) : super(key: key);

  @override
  State<EVMarketPage> createState() => _EVMarketPageState();
}

class _EVMarketPageState extends State<EVMarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreenColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kDarkGreenColor,
        title: Text(
          "EV SCOOPS",
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
            // Container(
            //   color: kDarkGreenColor,
            //   height: AppConstants.screenHeight(context) ,
            //   width: AppConstants.screenWidth(context),
            //   child: Padding(
            //     padding: EdgeInsets.all(10.0),
            //     child: Column(
            //       children: [

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:
                      EVScoopsList(context),
                    ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
