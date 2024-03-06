import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  String _selectedModel = ""; // Assign an initial value to _selectedModel
  String _registrationNumber = "";
  String _phoneNumber = "";
  // List<String> itemList = [];
  //
  // void addItemToList() {
  //   setState(() {
  //     itemList.add('New Item');
  //   });
  // }
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
              DropdownTextField(),
              // DropdownButton(
              //   hint: Text('Select vehicle model'),
              //   value: _selectedModel,
              //   items: ['Car', 'Motorcycle', 'Scooter', 'Others']
              //       .map((model) => DropdownMenuItem(
              //     value: model,
              //     child: Text(model),
              //   ))
              //       .toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       _selectedModel = value as String;
              //     });
              //   },
              // ),
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
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: itemList.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(itemList[index]),
              //       );
              //     },
              //   ),
              // ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // addItemToList();
                },
                child: Text('Submit'),
              ),

              // ElevatedButton(
              //
              //   onPressed: () {
              //     // Add vehicle to database or perform other actions
              //     // addItemToList
              //
              //   },
              //   child: Text('Submit'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}



class DropdownTextField extends StatefulWidget {
  @override
  _DropdownTextFieldState createState() => _DropdownTextFieldState();
}

class _DropdownTextFieldState extends State<DropdownTextField> {
  // String _selectedOption;
  // List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String dropdownvalue = 'Item 1';
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
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Select an option',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Option: ${items ?? "None"}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
