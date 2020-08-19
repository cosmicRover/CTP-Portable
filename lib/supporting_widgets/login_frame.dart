import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/login_bottom.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}