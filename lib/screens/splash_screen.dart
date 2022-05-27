import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shazaflutter/screens/login.dart';
import 'package:shazaflutter/screens/menu.dart';
import 'package:shazaflutter/shared/navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    void initState() {
    // TODO: implement initState

 Timer(const Duration(seconds: 2), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user == null) {
          navigateReplacement(context: context, route:  Login());
        } else {
          // Navigator.pushReplacementNamed(context, FirstScreen.id);

                    navigateReplacement(context: context, route:  Menu());


          //  print('User is signed in!');
        }
      });
    });
    // Future.delayed(Duration(seconds: 5), () {
    //   Navigator.pushReplacement(
    //       context,
    //       PageRouteBuilder(
    //           transitionDuration: Duration(seconds: 1),
    //           pageBuilder: (_, __, ___) => Login()
    //          // DrawerScreen()
    //           ));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold (
      // appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.blue.shade600,
      
      body:
      Center (
       
        child:  
            Column (
              
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                  Row (
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           new Icon(Icons.car_rental,size: 90,)
                        ],
                      ),
                      Column (
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text (
                            'PARK ME',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text (
                            'SMARTEST PARKING IN THE CITY',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),

                          
                        ],
                      ),
                    ],
                ),
           SizedBox(height:100),
                          CircularProgressIndicator(color: Colors.black)
          ],
        ),
      ),
    );
  }
}