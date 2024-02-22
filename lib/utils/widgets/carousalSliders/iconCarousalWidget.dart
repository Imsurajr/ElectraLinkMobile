import 'package:flutter/material.dart';
import '../../constants.dart';

class IconCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildWidgetItem(Icons.motorcycle_outlined, 'Test Ride', context),
          buildWidgetItem(Icons.star_border_outlined, 'Refer & Earn', context),
          buildWidgetItem(
              Icons.subscriptions_outlined, 'Subscription ', context),
          buildWidgetItem(Icons.cloud, 'Cloud Icon', context),
          buildWidgetItem(Icons.settings, 'Settings Icon', context),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }

  Widget buildWidgetItem(
      IconData iconData, String subheading, BuildContext context) {
    return Container(
      width: AppConstants.screenWidth(context) * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: kDarkGreenColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 30.0,
            color: Colors.white,
          ),
          Text(
            subheading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
