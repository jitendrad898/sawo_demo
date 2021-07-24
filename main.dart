//@dart = 2.9

import 'package:flutter/material.dart';
import 'package:sawo/sawo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String user;
  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
    });
  }

  void onPressed(String identifierType) {
    Sawo sawo = Sawo(
      apiKey: 'f0dd5c9b-f311-430b-a50e-c625eeb52752',
      secretKey: '60fb9cb5f540dd91339be6c5lfWaBsB9b5nuTt3XcyuZF2FR',
    );

    sawo.signIn(
      context: context,
      identifierType: identifierType,
      callback: payloadCallback,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UserData :- $user"),
            ElevatedButton(
              onPressed: () {
                onPressed('email');
              },
              child: Text('Email Login'),
            ),
            ElevatedButton(
              onPressed: () {
                onPressed('phone_number_sms');
              },
              child: Text('Phone Login'),
            ),
          ],
        ),
      ),
    );
  }
}
