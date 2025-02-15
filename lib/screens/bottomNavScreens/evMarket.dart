import 'package:electra_link/utils/constants.dart';
import 'package:electra_link/utils/widgets/evScoopsWidget/evScoopsWidget.dart';
import 'package:flutter/material.dart';

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
          "EV Market",
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
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:
                      EVScoopsMainList(context),
                    ),
          ],
        ),
      ),
    );
  }
}
