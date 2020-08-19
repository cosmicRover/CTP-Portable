import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBar extends StatelessWidget {
  AppColors _appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: Colors.white),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: _appColors.appDarkIndigo,),
              onPressed: null,
            ),
            Flexible(
              child: TextField(
                  decoration: InputDecoration(
                border: InputBorder.none,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
