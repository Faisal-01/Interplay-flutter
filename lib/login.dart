import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var text = "";
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

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
        return "Password should not be less than 5 characters";
      } else {
        return null;
      }
    }

    Future<dynamic> getData() async {
      var url = Uri.http("10.0.2.2:5000", "/api/v1/login");

      Map data = {'email': _email.text, 'password': _password.text};

      var body = json.encode(data);

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: body);

      return response;
    }

    // Future<void> submit() async {
    //   var response = await getData();

    //   if(_formKey.currentState!.validate())
    //   {

    //     if(response.statusCode == 200)
    //     {
    //       Map<String, dynamic> user = jsonDecode(response.body);
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => Home(user['_id'])),
    //       );
    //     }
    //     else{
    //       setState(() {
    //         text = response.body;
    //       });
    //     }

    //   }

    // }

    void submit() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      "Interplay",
                      style: TextStyle(fontSize: 48, color: Colors.blue),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        "assets/images/user.png",
                        height: 200,
                        width: 200,
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'Enter Password',
                            ),

                            // validator: validatePassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(onPressed: submit, child: const Text("Login")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      OutlinedButton(
                          child: Text("Register"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          })
                    ],
                  ),
                  Text(text)
                ]),
          ),
        ),
      ),
    );
  }
}
