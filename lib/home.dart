import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:sample_2/profile.dart';
import './post.dart';
import './drawer.dart';
import './profile.dart';
import './search.dart';

class Home extends StatefulWidget {
  // final String userId;

  // // receive data from the FirstScreen as a parameter
  // Home(this.userId);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  // HomeState(this.image);
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
      "name": "Talha Ihsan",
      "image": "assets/images/posts/post-2.jpg",
      "profilePic": "assets/images/people/person-2.jpg",
      "description": "A picture in the season of Autumn"
    },
    {
      "name": "Gul Faraz Ahmad",
      "image": "assets/images/posts/post-3.jpg",
      "profilePic": "assets/images/people/person-3.jpg",
      "description": "A picture in the season of Spring"
    },
  ];

  PageController page = PageController();

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) => getData());
  }

  // Future<void> getData() async {
  //   var url = Uri.http("10.0.2.2:5000", "/api/v1/post/timeline/${widget.userId}");

  //   var response = await http.get(url,
  //       headers: {"Content-Type": "application/json"});

  //   Map<String, dynamic> posts = jsonDecode(response.body);

  //   postList = posts["posts"];

  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text("Interplay"),
        // automaticallyImplyLeading: false,
        toolbarHeight: 80,
        titleTextStyle: TextStyle(fontSize: 30),

        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //     size: 30,
        //   ),
        //   tooltip: 'Menu Icon',
        //   onPressed: () {},
        // ),

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
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
          ), //IconButton
        ], //<W
      ),
      body: ListView(children: [
        Container(
          color: Colors.grey.shade300,
          child: Column(children: [
            Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
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
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.image))
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
          ]),
        ),
      ]),
    );
  }
}
