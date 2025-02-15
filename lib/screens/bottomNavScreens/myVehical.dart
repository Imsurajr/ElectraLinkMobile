import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electra_link/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'AddVehical.dart';

class Vehicle {}

class VehicleDataProvider extends ChangeNotifier {
  List<Vehicle> vehicles = [];

  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
    notifyListeners();
  }
}

class MyVehiclePage extends StatefulWidget {
  @override
  _MyVehiclePageState createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _model = "";
  String _registrationNumber = "";
  String _phoneNumber = "";

  bool _isLoadingDetails = false;
  bool check = false;
  var _userData = {};
  final _auth = FirebaseAuth.instance;

  void loadUserDetails() async {
    setState(() {
      _isLoadingDetails = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection("users")
          .doc(_auth.currentUser?.email)
          .get();
      if (userSnap.exists) {
        setState(() {
          _isLoadingDetails = false;
        });
        setState(() {
          _userData = userSnap.data()!;
        });
        _model = _userData['UserVehicle'];
        _registrationNumber = _userData['RegistrationNumber'];
        _phoneNumber = _userData['PhoneNumber'];
        print(
            "Model : $_model , Reg Num : $_registrationNumber, Phn : $_phoneNumber");
      }
    } catch (e) {
      setState(() {
        _isLoadingDetails =
            false; // Ensure to set _isLoadingDetails to false in case of error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    loadUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Vehicle'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddVehicleScreen()),
                );
              },
              child: Text('+ Add'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: !_userData.isEmpty
            ?
        // _isLoadingDetails
        //         ? Center(child: CircularProgressIndicator())
        //         :
            Column(
              children: [
                Center(
                  child: Container(
                    height: AppConstants.screenHeight(context)*0.15,
                    width: AppConstants.screenWidth(context)*0.9,
                    child: ListView(
                            padding: const EdgeInsets.all(8),
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: kDarkGreenColor),
                                child: ListTile(
                                  title: Text("Model: ${_userData['UserVehicle']}", style: TextStyle(
                                      color: Colors.white, fontFamily: "MontserratBold", fontSize: 25),),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Registration Number: ${_userData['VehicleRegNumber']}", style: TextStyle(
                                          color: Colors.white, fontFamily: "MontserratBold", fontSize: 20),),
                                      Text("Phone Number: ${_userData['PhoneNumber']}", style: TextStyle(
                                          color: Colors.white, fontFamily: "MontserratBold", fontSize: 20),),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ],
            )

            // ListView(
            //             itemCount: 1,
            //             itemBuilder: (BuildContext context, int index) {
            //               return ListTile(
            //                 title: Text("Model: $_model"),
            //                 subtitle: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text("Registration Number: $_registrationNumber"),
            //                     Text("Phone Number: $_phoneNumber"),
            //                   ],
            //                 ),
            //               );
            //             },
            //           )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image(
                        width: MediaQuery.of(context).size.width - 100,
                        height: MediaQuery.of(context).size.width - 100,
                        image: AssetImage(
                            "assets/images/addvehical_ev_img.png.jpg"),
                      ),
                    ),
                    SizedBox(
                        height:
                            20), // Add some space between the SVG image and the texts
                    // Texts
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Manage your vehicle at a single place and\n'
                          'Share your vehicle with friends and family\n'
                          '1. Unlock a more immersive experience by adding your vehicle information!\n'
                          '2. Share your vehicle with your loved ones.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}
