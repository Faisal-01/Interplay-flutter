// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './login.dart';
import './register_cont.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  var text = "";
  final TextEditingController _number = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final String onlyCharacters = r"^[\p{L} ,.'-]*$";

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _password = TextEditingController();

    String? next() {
      if (_formKey.currentState!.validate()) {
        print("correct format");
      } else {
        print("wrong format");
      }
    }

    String? validateFirstName(String? value) {
      // String format = r'/^[a-zA-Z]+/$';

      var regex = RegExp(onlyCharacters,
          caseSensitive: false, unicode: true, dotAll: true);

      if (value!.isEmpty) {
        return "Enter First Name";
      } else if (!regex.hasMatch(value)) {
        return "Only characters allowed";
      } else if (value.length < 3) {
        return "First Name should be atleast 3 ch long";
      } else {
        return null;
      }
    }

    String? validateLastName(String? value) {
      var regex = RegExp(onlyCharacters,
          caseSensitive: false, unicode: true, dotAll: true);

      if (value!.isEmpty) {
        return "Enter Last Name";
      } else if (!regex.hasMatch(value)) {
        return "Only characters allowed";
      } else if (value.length < 3) {
        return "Last Name should be atleast 3 ch long";
      } else {
        return null;
      }
    }

    String? validateUsername(String? value) {
      if (value!.isEmpty) {
        return "Enter Username";
      } else if (value.length < 3) {
        return "Username should be atleast 3 characters long";
      } else {
        return null;
      }
    }

    String? validateEmail(String? value) {
      if (value!.isEmpty) {
        return "Enter Email";
      }
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Enter Valid Email';
      } else {
        return null;
      }
    }

    String? validatePassword(String? value) {
      if (value!.isEmpty) {
        return "Enter Password";
      } else if (value.length < 5) {
        return "Password should be atleast 5 characters long";
      }  else {
        return null;
      }
    }

    String? validateNumber(String? value) {
      // var format = '^[0-9]+$';
      var regex = RegExp(r'^\d+$');

      if (value!.isEmpty) {
        return "Enter Number";
      }else if(!regex.hasMatch(value)){
        return "Only digits allowed";
      } else if (!(value.length == 10)) {
        return "Number should be 10 digits long";
      } else {
        return null;
      }
    }

    Future<void> registerHandler() async {
      var url = Uri.http("10.0.2.2:5000", "/api/v1/register");

      Map data = {
        'firstName': _firstName.text,
        'lastName': _lastName.text,
        'username': _username.text,
        'email': _email.text,
        'password': _password.text
      };

      var body = json.encode(data);

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);
      print(response.statusCode);
      setState(() {
        text = response.body;
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      "Interplay",
                      style: TextStyle(fontSize: 48, color: Colors.blue),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(children: [
                            Flexible(
                                child: TextFormField(
                              keyboardType: TextInputType.name,
                              validator: validateFirstName,
                              controller: _firstName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: 'Enter First Name',
                              ),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: TextFormField(
                              keyboardType: TextInputType.name,
                              validator: validateLastName,
                              controller: _lastName,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                hintText: 'Enter Last Name',
                              ),
                            ))
                          ]),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _username,
                            validator: validateUsername,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Username',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _email,
                            validator: validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Email',
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: _password,
                            validator: validatePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Password',
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _number,
                            validator: validateNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Number',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // ElevatedButton(
                  //     onPressed: registerHandler, child: const Text("Submit")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      OutlinedButton(
                          child: const Text("Login."),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          })
                    ],
                  ),
                  Text(text)
                ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: next,
            // (() => Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => RegisterCont()),
            //     )),
            child: const Icon(Icons.navigate_next)),
      ),
    );
  }
}
