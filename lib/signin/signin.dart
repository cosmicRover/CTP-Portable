import 'package:ctpportable/dashboard/dashboard.dart';
import 'package:ctpportable/services/auth_services.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.purple,
          child: FlatButton(
            child: Text("Sign"),
            onPressed: () {
              AuthServices().signInUser.then((isSuccessful) {
                if (isSuccessful) {
                  ///navigate to the dashboard
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                } else {
                  ///throw error
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
