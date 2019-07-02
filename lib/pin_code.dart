import 'package:flutter/material.dart';
import 'post_methods.dart';

class PinCode extends StatefulWidget {
  @override
  PinCodeState createState() => PinCodeState();
}

class PinCodeState extends State<PinCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Enter PIN code"),
              keyboardType: TextInputType.number,
              onChanged: (String textInput) {
                setState(() {
                  pinCode = textInput;
                });
              },
            ),
            new RaisedButton(
              child: Text('Send PIN'),
              onPressed: () {
                print(pinCode);
                pinValidation();
              },
            ),
          ],
        ),
      ),
    );
  }
}
