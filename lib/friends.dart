import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        height: 40,
        // alignment: Alignment.center,
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),

            filled: true, //<-- SEE HERE
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
            ),
            hintText: 'Search',
          ),
        ),
      )),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(children: [
            Container(
              color: Colors.grey.shade400,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Friends",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/persons/1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Umair Waheed"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/persons/2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Talha Ihsan"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/persons/3.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Gul Faraz Ahmad"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/persons/4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Salman Shabbir"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/persons/5.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Sauood Javed"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/people/person-2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Text("Noman Ali"),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Message"))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
