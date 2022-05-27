import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shazaflutter/screens/drawer.dart';
import 'package:shazaflutter/screens/login.dart';
import 'package:shazaflutter/shared/navigator.dart';

////////////////////////////3333
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('The Mall'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              navigateReplacement(context: context, route: Login());
            },
          ),
        ],
      ),
      body:  Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/park.jpg"), fit: BoxFit.cover,),
          ),
        ),
        new Center(
          child: new Text("Hello Parking"),
        )
      ],
    ),
      drawer: MyDrawer(),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Center(
      //           child: Text(
      //             'The Mall',
      //             style: TextStyle(color: Colors.white, fontSize: 52),
      //           ),
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           // image: DecorationImage(
      //           //     fit: BoxFit.fill,
      //           //     image: AssetImage('assets/images/cover.jpg'))
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle_outlined),
      //         title: Text('UserName'),
      //         onTap: () => {},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('My Profile'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home_outlined),
      //         title: Text('Home'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.paid),
      //         title: Text('Pay Ment'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_balance),
      //         title: Text('Balance'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.notification_important),
      //         title: Text('Notification'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.info),
      //         title: Text('About Us'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.help),
      //         title: Text('Get Help'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.maps_ugc_sharp),
      //         title: Text('Map'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.history),
      //         title: Text('History'),
      //         onTap: () => {Navigator.of(context).pop()},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
