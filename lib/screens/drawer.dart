import 'package:flutter/material.dart';
import 'package:shazaflutter/screens/balance.dart';
import 'package:shazaflutter/screens/history.dart';
import 'package:shazaflutter/screens/map.dart';
import 'package:shazaflutter/screens/pagination_data_table.dart';
import 'package:shazaflutter/screens/payment_screen.dart';
import 'package:shazaflutter/screens/profile.dart';
import 'package:shazaflutter/shared/navigator.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'The Mall',
                style: TextStyle(color: Colors.white, fontSize: 52),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'))
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('UserName'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('My Profile'),
            onTap: () {
              popandNavigate(context: context, route: Profile());
            },
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          // ListTile(
          //   leading: Icon(Icons.paid),
          //   title: Text('Pay Ment'),
          //   onTap: (){

          //     popandNavigate(context: context , route: PaymentScreen());
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Balance'),
            onTap: () {
              popandNavigate(context: context, route: Balance());
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('History'),
            onTap: () {
              popandNavigate(context: context, route: History());
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Notification'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Get Help'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.maps_ugc_sharp),
            title: Text('Map'),
            onTap: () {
              popandNavigate(context: context, route: MapScreen());
            },
          ),
        ],
      ),
    );
  }
}
