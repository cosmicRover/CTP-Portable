import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple,
          child: FlatButton(
            child: Text("Signin"),
            onPressed: () => print("tapped button"),
          ),
        ),
      ),
    );
  }
}
