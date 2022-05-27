import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:shazaflutter/model/map_sets.dart';
import 'package:shazaflutter/screens/menu.dart';
import 'package:shazaflutter/shared/navigator.dart';

//void main() => runApp(MyApp());

class VisaDetails extends StatefulWidget {
  VisaDetails({
    required this.mapModel,
  });
  MapModel mapModel;

  @override
  State<VisaDetails> createState() => _VisaDetailsState();
}

class _VisaDetailsState extends State<VisaDetails> {
  DateTime now = DateTime.now();
  num hours = 0;
  @override
  void initState() {
    hours = now.difference((widget.mapModel.time!.toDate())).inHours;
    timeController.text = '${hours.toString()} min';
    valueController.text =
        (widget.mapModel.price! * (hours / 60)).toStringAsFixed(2);
    print(hours);
    // TODO: implement initState

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool flipCard = false;
  String cardNumber = "";
  String expDate = "";
  String cvc = "";
  String cardName = "";

  final timeController = TextEditingController(),
      valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ViasCard';
    return Scaffold(
      appBar: AppBar(
        title: Text('ViasCard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
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
                          cardHolderName: cardName,
                          cvv: cvc,
                          cardType: CardType
                              .masterCard, // Optional if you want to override Card Type
                          showBackSide: flipCard,
                          frontBackground: CardBackgrounds.black,
                          backBackground: CardBackgrounds.white,
                          showShadow: true,
                          textExpDate: 'Exp. Date',
                          textName: 'Name',
                          textExpiry: 'MM/YY'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
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
                      onChanged: (s) {
                        setState(() {
                          cardName = s;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
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
                      onChanged: (s) {
                        setState(() {
                          cardNumber = s;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
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
                      onChanged: (s) {
                        setState(() {
                          cvc = s;
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
                      onChanged: (s) {
                        setState(() {
                          expDate = s;
                        });
                      },
                    ),
                    //  SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // MyCustomForm(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Set Name:  '),
                  Text(widget.mapModel.setName!.toString()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price Per Hour:  '),
                Text(widget.mapModel.price!.toString()),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: unnecessary_new
                RaisedButton(
                  child: Text('Pay'),
                  onPressed: () {
                    // It returns true if the form is valid, otherwise returns false
                    if (_formKey.currentState!.validate()) {
                      MapModel mapModel = MapModel(
                          setName: widget.mapModel.setName,
                          price: widget.mapModel.price,
                          time: Timestamp.fromDate(DateTime.now()),
                          status: true,
                          id: '',
                          name: '');

                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('history')
                          .doc()
                          .set({
                        'startTime': widget.mapModel.time,
                        'time': timeController.text,
                        'endTime': now,
                        "price": valueController.text,
                        "setName": widget.mapModel.setName,
                        "setPrice": '${widget.mapModel.price} in Hour',
                      });

                      FirebaseFirestore.instance
                          .collection('map')
                          .doc(widget.mapModel.setName.toString())
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
                  cardHolderName: cardName,
                  cvv: cvc,
                  cardType: CardType
                      .masterCard, // Optional if you want to override Card Type
                  showBackSide: flipCard,
                  frontBackground: CardBackgrounds.black,
                  backBackground: CardBackgrounds.white,
                  showShadow: true,
                  textExpDate: 'Exp. Date',
                  textName: 'Name',
                  textExpiry: 'MM/YY'),
            ),
            SizedBox(
              height: 8,
            ),
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
              onChanged: (s) {
                setState(() {
                  cardName = s;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
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
              onChanged: (s) {
                setState(() {
                  cardNumber = s;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
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
              onChanged: (s) {
                setState(() {
                  cvc = s;
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
              onChanged: (s) {
                setState(() {
                  expDate = s;
                });
              },
            ),
            //  SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
