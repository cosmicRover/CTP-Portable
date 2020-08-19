import 'package:flutter/material.dart';

class MentorsViewFrames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/mentor_frame.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
