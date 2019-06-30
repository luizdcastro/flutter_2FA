import 'package:flutter/material.dart';
import 'post_methods.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              onChanged: (String textInput) {
                setState(() {
                  mobileNumber = textInput;
                });
              },
            ),
            new RaisedButton(
              child: Text('Send PIN'),
              onPressed: requestMethod,
            ),
          ],
        ),
      ),
    );
  }
}
