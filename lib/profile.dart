import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './post.dart';
import './search.dart';

class Profile extends StatelessWidget {
  String? image;
  String? name;
  String? profilePic;
  String? description;
  List<Map<String, String>> postList = [
    {
      "name": "Faisal Iqbal",
      "image": "assets/images/posts/post-1.jpg",
      "profilePic": "assets/images/people/person-1.jpg",
      "description": "A beautiful Picture"
    },
    {
      "name": "Faisal Iqbal",
      "image": "assets/images/posts/post-2.jpg",
      "profilePic": "assets/images/people/person-1.jpg",
      "description": "A picture in the season of Autumn"
    },
    {
      "name": "Faisal Iqbal",
      "image": "assets/images/posts/post-3.jpg",
      "profilePic": "assets/images/people/person-1.jpg",
      "description": "A picture in the season of Spring"
    },
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          // automaticallyImplyLeading: false,
          toolbarHeight: 80,
          titleTextStyle: TextStyle(fontSize: 30),

          actions: <Widget>[
            //IconButton
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              tooltip: 'Search Icon',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                );
              },
            ), //IconButton
          ], //<W
        ),
        body: ListView(children: [
          Container(
            color: Colors.grey.shade400,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Image.asset('assets/images/posts/1.webp',
                                fit: BoxFit.cover),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              alignment: Alignment.bottomLeft,

                              // backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 74,
                                backgroundColor: Colors.grey.shade200,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(8), // Border radius
                                  child: ClipOval(
                                      child: Image.asset(
                                          'assets/images/people/person-1.jpg')),
                                ),
                              ))
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Faisal Iqbal",
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(child: Text("Country:"))),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Pakistan"))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(child: Text("City:"))),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Gaggoo"))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                        child: Text("Relationship:"))),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Single"))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/persons/1.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Salman Shabbir")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/persons/3.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Talha Ihsan")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/persons/4.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Gul Faraz Ahmad")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Flexible(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/persons/5.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Umair Waheed")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Flexible(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/persons/2.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Sauood Javed")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Flexible(
                                  child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(60), // Image radius
                                  child: Image.asset(
                                      'assets/images/people/person-2.jpg',
                                      fit: BoxFit.contain),
                                ),
                              )),
                              Text("Noman Ali")
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()),
                              );
                            }, // Image tapped
                            child: CircleAvatar(
                              radius: 32,
                              // backgroundColor: Colors.red,
                              child: ClipOval(
                                  child: Image.asset(
                                      'assets/images/people/person-1.jpg')),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              hintText: 'What do you what to post?',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Icon(Icons.image))
                      ],
                    )),
                ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    print(postList[index]["img"]);
                    return Post(
                        image = postList[index]["image"]!,
                        name = postList[index]["name"]!,
                        profilePic = postList[index]["profilePic"]!,
                        description = postList[index]["description"]!);
                  },
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                )
              ],
            ),
          ),
        ]));
  }
}
