import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shazaflutter/screens/menu.dart';
import 'package:shazaflutter/screens/mm.dart';
import 'package:shazaflutter/screens/visa_details.dart';
import 'package:shazaflutter/shared/navigator.dart';

import '../model/map_sets.dart';
///////////////4444444444444444

enum SingingCharacter { Cash, Visa }
bool navigateToPage = false;

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key, required this.myModel}) : super(key: key);
  MapModel myModel;
  @override
  State<PaymentScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<PaymentScreen> {
  SingingCharacter? _character = SingingCharacter.Cash;

  DateTime now = DateTime.now();
  num hours = 0;
  @override
  void initState() {
    hours = now.difference((widget.myModel.time!.toDate())).inMinutes;
    timeController.text = '${hours.toString()} min';
    valueController.text =
        (widget.myModel.price! * (hours / 60)).toStringAsFixed(2);
    print(hours);
    // TODO: implement initState

    super.initState();
  }

  final timeController = TextEditingController(),
      valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Cash'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Cash,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Visa'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Visa,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                    navigateToPage = true;
                  });
                  if (navigateToPage) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return VisaDetails(
                        mapModel: widget.myModel,
                      );
                    }));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Set Name:  '),
                  Text(widget.myModel.setName!.toString()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price Per Hour:  '),
                Text(widget.myModel.price!.toString()),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: timeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.alarm),
                  labelText: 'Time',
                ),
                readOnly: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: valueController,
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monetization_on_sharp),
                  labelText: 'value',
                ),
                readOnly: true,
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Submit'),
              onPressed: () {
                MapModel mapModel = MapModel(
                    setName: widget.myModel.setName,
                    price: widget.myModel.price,
                    time: Timestamp.fromDate(DateTime.now()),
                    status: true,
                    id: '',
                    name: '',
                    rfId: ' ');

                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('history')
                    .doc()
                    .set({
                  'startTime': widget.myModel.time,
                  'time': timeController.text,
                  'endTime': now,
                  "price": valueController.text,
                  "setName": widget.myModel.setName,
                  "setPrice": '${widget.myModel.price} in Hour',
                  "rfId": '${widget.myModel.rfId}',
                });

                FirebaseFirestore.instance
                    .collection('map')
                    .doc(widget.myModel.setName.toString())
                    .update(mapModel.toMap())
                    .then((value) {
                  const snackBar = SnackBar(
                    content: Text('Payment completed successfully'),
                  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  navigateReplacement(context: context, route: Menu());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
