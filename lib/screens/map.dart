import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shazaflutter/model/map_sets.dart';
import 'package:shazaflutter/screens/payment_screen.dart';
import 'package:shazaflutter/screens/timepicker.dart';
import 'package:shazaflutter/shared/navigator.dart';

import 'mm.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     for (int i = 1; i <= 50; i++) {
      //       MapModel mapModel = MapModel(
      //         setName: i,
      //         id: "",
      //         status: true,
      //         price: 10,
      //         time: Timestamp.fromDate(DateTime.now()),
      //         name: "",
      //       );
      //       FirebaseFirestore.instance
      //           .collection('map')
      //           .doc("$i")
      //           .set(mapModel.toMap());
      //     }
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: <Widget>[Text("Enter"), Icon(Icons.arrow_back)],
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('map').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  } else if (snapshot.hasData) {
                    final myData = snapshot.data!.docs.map((e) {
                      return MapModel.fromMap(e.data() as Map<String, dynamic>);
                    }).toList();
                    myData.sort((a, b) => (a.setName!).compareTo(b.setName!));
                    //   print(myData[3].setName);
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, childAspectRatio: 1.0),
                      itemCount: myData.length,
                      itemBuilder: (context, index) {
                        return ParkingCar(
                          mapModel: myData[index],
                        );
                        // if ((index + 1) % 6 == 0) {
                        //   x = 1;
                        //   return si();
                        // } else {
                        //   x = 6;

                        // }
                      },
                      // childrenDelegate: SliverChildListDelegate(
                      //   List.generate(50, (index) {
                      //     return Container(
                      //         padding: EdgeInsets.all(20.0),
                      //         child: Center(
                      //           child: GridTile(
                      //             child: IconButton(
                      //                 icon:
                      //                     Icon(Icons.car_rental, color: _iconColor),
                      //                 onPressed: () {
                      //                   setState(() {
                      //                     _iconColor = Colors.red;
                      //                   });
                      //                 }),
                      //           ),
                      //         ));
                      //   }),
                      // )
                    );
                  }
                  return CircularProgressIndicator();
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text("Exit"), Icon(Icons.arrow_forward)],
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingCar extends StatefulWidget {
  ParkingCar({Key? key, required this.mapModel}) : super(key: key);
  MapModel mapModel;

  @override
  State<ParkingCar> createState() => _ParkingCarState();
}

class _ParkingCarState extends State<ParkingCar> {
  @override
  // TimeOfDay selectedTime = TimeOfDay.now();
  // @override
  // void initState() {
  //   super.initState();
  //   int total = (selectedTime-TimeOfDay.now()).inMinutes;
  // }

  String time = '00';
  // _selectTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime) {
  //     setState(() {
  //       selectedTime = timeOfDay;
  //       print(selectedTime);
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          widget.mapModel.status!
              ? showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.white24,
                      child: Center(
                        child: RegisterSet(myModel: widget.mapModel),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: <Widget>[
                        //     Text(widget.mapModel.setName.toString()),
                        //     GestureDetector(
                        //         onTap: () {
                        //           _selectTime(context);
                        //         },
                        //         child: Text(selectedTime.format(context))),
                        //     ElevatedButton(
                        //       child: const Text('Save'),
                        //       onPressed: () async {
                        //         MapModel mapModel = MapModel();
                        //         // await FirebaseFirestore.instance
                        //         //     .collection('map')
                        //         //     .doc(widget.mapModel.setName.toString())
                        //         //     .update();
                        //       },
                        //     )
                        //   ],
                        // ),
                      ),
                    );
                  },
                )
              : widget.mapModel.id == FirebaseAuth.instance.currentUser!.uid
                  ? navigate(
                      context: context,
                      route: PaymentScreen(myModel: widget.mapModel))
                  // ? showModalBottomSheet<void>(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(25),
                  //         topLeft: Radius.circular(25),
                  //       ),
                  //     ),
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return Container(
                  //         height: 200,
                  //         color: Colors.white24,
                  //         child: Center(
                  //           child: RegisterSet(myModel: widget.mapModel),
                  //           // child: Column(
                  //           //   mainAxisAlignment: MainAxisAlignment.center,
                  //           //   mainAxisSize: MainAxisSize.min,
                  //           //   children: <Widget>[
                  //           //     Text(widget.mapModel.setName.toString()),
                  //           //     GestureDetector(
                  //           //         onTap: () {
                  //           //           _selectTime(context);
                  //           //         },
                  //           //         child: Text(selectedTime.format(context))),
                  //           //     ElevatedButton(
                  //           //       child: const Text('Save'),
                  //           //       onPressed: () async {
                  //           //         MapModel mapModel = MapModel();
                  //           //         // await FirebaseFirestore.instance
                  //           //         //     .collection('map')
                  //           //         //     .doc(widget.mapModel.setName.toString())
                  //           //         //     .update();
                  //           //       },
                  //           //     )
                  //           //   ],
                  //           // ),
                  //         ),
                  //       );
                  //     },
                  //   )
                  : null;
        },
        child: Card(
            elevation: 20,
            color: widget.mapModel.status!
                ? Colors.green
                : widget.mapModel.id! == FirebaseAuth.instance.currentUser!.uid
                    ? Colors.blue
                    : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              width: 300,
              height: 200,
              child: Center(
                  child: Text(widget.mapModel.setName.toString(),
                      style: TextStyle(fontSize: 35))),
            )),
      ),

      // child: Center(
      //   child: Container(
      //     width: 50,
      //     height: 60,
      //     color: widget.mapModel.status! ? Colors.green : Colors.red,
      //     child: Column(
      //       children: [
      //         IconButton(
      //           icon: Icon(
      //             Icons.car_rental,
      //             size: 20,
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               //  widget.busy = !widget.busy;

      //               navigate(context: context, route: MyHomePage());
      //               //                       _selectTime(BuildContext context) async {
      //               //     TimeOfDay? selectedTime = TimeOfDay.now();
      //               //     final TimeOfDay? timeOfDay = await showTimePicker(
      //               //       context: context,
      //               //       initialTime: selectedTime,
      //               //       initialEntryMode: TimePickerEntryMode.dial,

      //               //     );
      //               //     if(timeOfDay != null && timeOfDay != selectedTime )
      //               //       {
      //               //         setState(() {
      //               //           selectedTime = timeOfDay;

      //               //         });
      //               //       }

      //               // }
      //             });
      //           },
      //         ),
      //         Text(
      //           widget.mapModel.setName!,
      //           style: TextStyle(
      //             fontSize: 10,
      //             overflow: TextOverflow.clip,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class RegisterSet extends StatefulWidget {
  RegisterSet({Key? key, required this.myModel}) : super(key: key);
  MapModel myModel;
  @override
  State<RegisterSet> createState() => _RegisterSetState();
}

class _RegisterSetState extends State<RegisterSet> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime time = DateTime.now();
  String custName = '', StringTime = '';

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        time = DateTime(time.year, time.month, time.day, selectedTime.hour,
            selectedTime.minute);
        StringTime = DateFormat('kk:mm').format(time);

        print(DateTime(time.year, time.month, time.day, selectedTime.hour,
            selectedTime.minute));
        print(time);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  @override
  void initState() {
    time = DateTime.now();
    // TODO: implement initState
    StringTime = DateFormat('kk:mm').format(time);
    //TODO  widget.myModel.time == '' ? null : time = widget.myModel.time!;
    super.initState();
  }

  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.myModel.setName.toString()),
          Padding(
            padding: EdgeInsets.all(15),
            child: widget.myModel.name == ''
                ? TextFormField(
                    // initialValue: custName,
                    controller: name,
                    validator: (s) {
                      if (s == null || s.isEmpty) {
                        return 'Please enter a name';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                    ),
                  )
                : Text(widget.myModel.name!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Time:   ',
                style: TextStyle(fontSize: 15),
              ),
              GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Text(StringTime)),
            ],
          ),
          ElevatedButton(
            child: const Text('Save'),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                Random random = Random();
                int x = random.nextInt(5000);
                int y = random.nextInt(5000);
                MapModel mapModel = MapModel(
                    time: Timestamp.fromDate(DateTime(time.year, time.month,
                        time.day, selectedTime.hour, selectedTime.minute)),
                    status: false,
                    name: name.text,
                    setName: widget.myModel.setName,
                    price: 10,
                    id: FirebaseAuth.instance.currentUser!.uid,
                    rfId: '${x}B${y}');
                await FirebaseFirestore.instance
                    .collection('map')
                    .doc(widget.myModel.setName.toString())
                    .update(mapModel.toMap())
                    .then((value) {
                  Navigator.pop(context);
                });
              }
            },
          ),
          // ElevatedButton(
          //     child: const Text('Submit'),
          //     onPressed: () {
          //       setState(() {
          //         print(total);
          //       });
          //     })
        ],
      ),
    );
  }
}


// class si extends StatelessWidget {
//   const si({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           height: 50,
//           //   width: double.infinity,
//         ),
//         SizedBox(
//           height: 50,
//           //  width: double.infinity,
//         ),
//         SizedBox(
//           height: 50,
//           //    width: double.infinity,
//         ),
//         SizedBox(
//           height: 50,
//           // width: double.infinity,
//         ),
//         SizedBox(
//           height: 50,
//           //  width: double.infinity,
//         ),
//         SizedBox(
//           height: 50,
//           //          width: double.infinity,
//         ),
//       ],
//     );
//   }
// }
