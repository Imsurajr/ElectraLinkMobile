import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _selectedModel = "";
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
      } else {}
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.toString()),
      //     duration: Duration(seconds: 2),
      //   ),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vehicle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Model *',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownTextField(
                onChanged: (String newValue) {
                  setState(() {
                    _selectedModel = newValue;
                  });
                },
              ),
              Text('Selected Model: $_selectedModel'),

              SizedBox(height: 20.0),
              Text(
                'Registration Number',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter registration number',
                ),
                onChanged: (value) {
                  setState(() {
                    _registrationNumber = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Sharing this vehicle with friends/family?',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Add them to your vehicle pool and win exciting rewards in the future',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(10),
                ],
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
              SizedBox(height: 20.0),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("new value : $_selectedModel ");
                  if (_selectedModel.length > 0 ||
                      _registrationNumber.length > 0 ||
                      _phoneNumber.length == 10) {

                    if (_userData['PhoneNumber'] == null ||
                        _userData['UserVehicle'] == null||
                        _userData['VehicleRegNumber'] == null ) {
                      check = true;
                    }
                    if (check) {
                      Map<String, dynamic> dataToUpdate = {};

                      if (_selectedModel.length > 0) {
                        dataToUpdate['UserVehicle'] = _selectedModel;
                      }

                      if (_registrationNumber.length > 0) {
                        dataToUpdate['VehicleRegNumber'] = _registrationNumber;
                      }

                      if (_phoneNumber.length == 10) {
                        dataToUpdate['PhoneNumber'] = _phoneNumber;
                      }

                      // Update Firestore
                      _firestore
                          .collection('users')
                          .doc(_userData['email'])
                          .set(dataToUpdate)
                          .then((value) {
                        print('User data updated successfully');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('User data updated successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }).catchError((error) {
                        // Show error to user using SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to update user data: $error'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please provide at least one piece of information'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } else {
                    if (!_userData['PhoneNumber'].isNullOrBlank ||
                        _userData['UserVehicle'].isNullOrBlank ||
                        _userData['VehicleRegNumber'].isNullOrBlank) {
                      Map<String, dynamic> dataToUpdate = {};

                      if (_selectedModel.length > 0) {
                        dataToUpdate['UserVehicle'] = _selectedModel;
                      }

                      if (_registrationNumber.length > 0) {
                        dataToUpdate['VehicleRegNumber'] = _registrationNumber;
                      }

                      if (_phoneNumber.length == 10) {
                        dataToUpdate['PhoneNumber'] = _phoneNumber;
                      }

                      _firestore
                          .collection('users')
                          .doc(_userData['email'])
                          .update(dataToUpdate)
                          .then((value) {
                        print('User data updated successfully');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('User data updated successfully'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }).catchError((error) {
                        // Show error to user using SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to update user data: $error'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please provide at least one piece of information'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                  Future.delayed(Duration(seconds: 4), () {
                    Navigator.pop(context);
                  });
                },
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class DropdownTextField extends StatefulWidget {
  final Function(String) onChanged;

  const DropdownTextField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  String dropdownValue = 'Tata Nexon EV';
  var items = [
    'Tata Nexon EV',
    'Tata Punch EV',
    'BYD Seal',
    'MG Commet EV',
    'OLA S1 X+',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            value: dropdownValue,
            items: items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                widget.onChanged(
                    newValue); // Call the callback function with the new value
              });
            },
            decoration: InputDecoration(
              labelText: 'Select a model',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Option: $dropdownValue',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
