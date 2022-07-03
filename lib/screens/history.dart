import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shazaflutter/model/history_model.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('history')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              final myData = snapshot.data!.docs.map((e) {
                return HistoryModel.fromMap(e.data() as Map<String, dynamic>);
              }).toList();
              // myData.sort((a, b) => (a.setName!).compareTo(b.setName!));
              // //   print(myData[3].setName);
              return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            // ListTile(
                            //   title: Text(myData[index].setName.toString()),
                            //   subtitle: Column(
                            //     children: [
                            //       // Text(myData[index].startTime.toString()),
                            //       // Text(myData[index].endTime!.toDate().toString()),
                            //     ],
                            //   ),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Set Number: '),
                                    Text(myData[index].setName.toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Set Price: '),
                                    Text(myData[index].setPrice.toString()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text('RFID: '),
                                Text(myData[index].rfId.toString()),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text('Start Time: '),
                                Text(myData[index]
                                    .startTime!
                                    .toDate()
                                    .toString()
                                    .replaceAll(':00.000', '')),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text('End Time: '),
                                Text(myData[index]
                                    .endTime!
                                    .toDate()
                                    .toString()
                                    .replaceAll(':00.000', '')),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text('Price: '),
                                Text(myData[index].price!.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
