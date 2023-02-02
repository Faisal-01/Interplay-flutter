import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './register.dart';
import 'package:intl/intl.dart';

class RegisterCont extends StatefulWidget {
  const RegisterCont({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterContState();
  }
}

class RegisterContState extends State<RegisterCont> {
  var text = "";
  TextEditingController dateInput = TextEditingController();

  final TextEditingController _country = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _relationship = TextEditingController();

  int _groupValue = 0;

  String dropdownvalue = 'Single';

  // List of items in our dropdown menu
  var items = ['Single', 'In a Relationship', 'Married'];

  @override
  Widget build(BuildContext context) {
    Future<void> registerHandler() async {
      var url = Uri.http("10.0.2.2:5000", "/api/v1/register");

      Map data = {
        // 'firstName': _number.text,
        'lastName': _country.text,
        'username': _city.text,
        'email': _gender.text,
        'password': _relationship.text
      };

      var body = json.encode(data);

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      setState(() {
        text = response.body;
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register Cont"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: const Text(
                      "Interplay",
                      style: TextStyle(fontSize: 48, color: Colors.blue),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _country,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: 'Enter Country',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _city,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            hintText: 'Enter City',
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    30) //                 <--- border radius here
                                ),
                          ),
                          child: TextField(
                            controller: dateInput,

                            //editing controller of this TextField
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                border: InputBorder.none,
                                labelText:
                                    "Enter Date of Birth" //label text of field
                                ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                // print(
                                //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                // print(
                                //     formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(
                              30) //                 <--- border radius here
                          ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,

                          // Array list of items
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
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: _myRadioButton(
                          title: "Male",
                          value: 0,
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue),
                        ),
                      ),
                      Flexible(
                        child: _myRadioButton(
                          title: "Female",
                          value: 1,
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: registerHandler, child: const Text("Submit")),
                  Text(text)
                ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (() => Navigator.pop(context)),
            child: const Icon(Icons.navigate_before)),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }

  Widget _myRadioButton(
      {required String title,
      required int value,
      required Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: (value) => onChanged(value),
      title: Text(title),
    );
  }
}
