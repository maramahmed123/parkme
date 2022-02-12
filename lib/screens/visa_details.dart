
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_card/awesome_card.dart';

//void main() => runApp(MyApp());

class VisaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ViasCard';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ViasCard'),
        ),
        body:SingleChildScrollView(
            child: MyCustomForm(),
        ),
      ),
    );
  }
}
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  bool flipCard = false;
 String cardNumber = "";
  String expDate = "";
  String cvc = "";
    String cardName = "";

    @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
               onHorizontalDragEnd: (details) {
                      flipCard = !flipCard;
                      setState(() {});
                    },
                          child: CreditCard(
    cardNumber: cardNumber,
    cardExpiry: expDate,
    cardHolderName:cardName,
    cvv: cvc,
    cardType: CardType.masterCard, // Optional if you want to override Card Type
                        showBackSide: flipCard,
    frontBackground: CardBackgrounds.black,
    backBackground: CardBackgrounds.white,
    showShadow: true,
    textExpDate: 'Exp. Date',
    textName: 'Name',
    textExpiry: 'MM/YY'
),
            ),
            SizedBox(height: 8,),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Enter your Card name',
                labelText: 'Card Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Card name';
                }
                return null;
              },
              onChanged: (s){
                setState(() {
                  cardName = s ;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                new LengthLimitingTextInputFormatter(16)
              ],
              obscureText: true,
              decoration: const InputDecoration(
                icon: const Icon(Icons.credit_card),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid Card number';
                }
                return null;
              },
               onChanged: (s){
                setState(() {
                  cardNumber = s ;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
                new LengthLimitingTextInputFormatter(3)
              ],
              obscureText: true,
              decoration: const InputDecoration(
                icon: const Icon(Icons.credit_card_sharp),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid CVV number';
                }
                return null;
              },
               onChanged: (s){
                setState(() {
                  cvc = s ;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid date';
                }
                return null;
              },
               onChanged: (s){
                setState(() {
                  expDate = s ;
                });
              },
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: unnecessary_new
                 RaisedButton(
                  child:  Text('Pay'),
                  onPressed: () {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Data is in processing.')));
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}