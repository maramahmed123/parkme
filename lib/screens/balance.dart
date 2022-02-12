import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(' Park Me',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),


      ),

      body: Padding(

        padding: const EdgeInsets.all(15.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            Text(
              'You have ',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '1500.00',
                  style: TextStyle(
                    backgroundColor:CupertinoColors.activeBlue,
                    color: Colors.white,
                    fontSize: 35.0,

                  ),
                ),
              ],
            ),
            Text('on your count',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blue,

                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),

    );

  }


}