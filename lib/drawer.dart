import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './login.dart';
import './profile.dart';
import './friends.dart';

class drawer extends StatelessWidget {
  // static Drawer myDrawer(){
  //   return Drawer(
  //     child: Text("hello g"),
  //   );
  // }

  @override
  Drawer build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Menu',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
          ListTile(
            title: const Text(
              'Friends',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Friends()));
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
