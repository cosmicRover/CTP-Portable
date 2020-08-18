import 'package:flutter/material.dart';

class ViewFrames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/top.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            "assets/bottom.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
