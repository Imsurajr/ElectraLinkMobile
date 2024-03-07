import 'package:flutter/material.dart';
import 'AddVehical.dart';
// Data models (if applicable)
class Vehicle {
  // ... vehicle properties
}

// class User {
//   // ... user properties
// }

// State provider (if applicable)
class VehicleDataProvider extends ChangeNotifier {
  List<Vehicle> vehicles = [];

  void addVehicle(Vehicle vehicle) {
    vehicles.add(vehicle);
    notifyListeners();
  }

// ... other data management methods
}

class MyVehiclePage extends StatefulWidget {
  @override
  _MyVehiclePageState createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  @override
  Widget build(BuildContext context) {

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Vehicle'),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.add),
    //         onPressed: () {
    //           // Add your onPressed functionality here
    //         },
    //         color: Colors.green,
    //       ),
    //     ],
    //   ),
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
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.green, // Set the background color to green
              // ),
              // child: Text(
              //   '+ Add',
              //   style: TextStyle(
              //     color: Colors.white, // Set the text color to white
              //   ),
              // ),
              child: Text('+ Add'),
            ),
          ],
        ),
        // ... actions (e.g., add button)
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SVG image
                Container(
                  // Replace 'assets/image.svg' with the path to your SVG file
                  child: Image(
                    width: MediaQuery.of(context).size.width - 100,
                    height: MediaQuery.of(context).size.width - 100,
                    image: AssetImage("assets/images/addvehical_ev_img.png.jpg"),
                  ),
                ),
                SizedBox(height: 20), // Add some space between the SVG image and the texts
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     // Vehicle list or details (if applicable)
          //     Text('Manage your vehicle at a single place and'),
          //     Text('Share your vehicle with friends and family'),
          //     Text('1. Unlock a more immersive experience by adding your vehicle information!'),
          //     Text('2. Share your vehicle with friends and family.'),
          //
          //   ],
          // ),
        ),
      ),
    );
  }
}
