import 'package:flutter/material.dart';

class RedViewFrames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/top_red.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}