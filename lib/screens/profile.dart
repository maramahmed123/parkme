import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shazaflutter/model/user.dart';
import 'package:shazaflutter/shared/infocard.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email!,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              final myData = snapshot.data!.data();
              final myUser = UserModel.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);
              print(myUser.email);
              return Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  Text(
                    myUser.name!,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                    ),
                  ),
                  // Text(
                  //   "Flutter Developer",
                  //   style: TextStyle(
                  //       fontSize: 30,
                  //       color: Colors.blueGrey[200],
                  //       letterSpacing: 2.5,
                  //       fontWeight: FontWeight.bold,
                  //       fontFamily: "Source Sans Pro"),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  //   width: 200,
                  //   child: Divider(
                  //     color: Colors.white,
                  //   ),
                  // ),

                  // we will be creating a new widget name info carrd

                  InfoCard(
                      text: myUser.phone!,
                      icon: Icons.phone,
                      onPressed: () async {}),
                  // InfoCard(text: url, icon: Icons.web, onPressed: () async {}),
                  // InfoCard(
                  //     text: location,
                  //     icon: Icons.location_city,
                  //     onPressed: () async {}),
                  InfoCard(
                      text: myUser.email!,
                      icon: Icons.email,
                      onPressed: () async {}),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
