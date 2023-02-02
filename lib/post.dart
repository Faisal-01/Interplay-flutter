import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class Post extends StatelessWidget {
  Post(this.image, this.name, this.profilePic, this.description);
  final String image;
  final String name;
  final String profilePic;
  final String description;
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(32), // Image radius
                  child: Image.asset(
                    profilePic,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 5), child: Text(name)),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: Text(
              description,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.red,
            child: Image.asset(image, fit: BoxFit.fitWidth),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        //                   <--- right side
                        color: Colors.white,
                        width: 3.0,
                      ),
                    )),
                    child: ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.thumb_up))),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        //                   <--- right side
                        color: Colors.white,
                        width: 3.0,
                      ),
                    )),
                    child: ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.comment))),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.share))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
