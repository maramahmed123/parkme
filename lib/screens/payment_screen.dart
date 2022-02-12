import 'package:flutter/material.dart';
import 'package:shazaflutter/screens/visa_details.dart';
///////////////4444444444444444

enum SingingCharacter { Cash,Visa }
bool navigateToPage = false;
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<PaymentScreen> {
  SingingCharacter? _character = SingingCharacter.Cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment'),
      centerTitle: true,),
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
                          return VisaDetails();
                        }));
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
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
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon:Icon(Icons.monetization_on_sharp),
                  labelText: 'value',
                ),
                readOnly: true,
              ),
            ),
            Padding (
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'location',
                ),
                readOnly: true,
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Submit'),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
