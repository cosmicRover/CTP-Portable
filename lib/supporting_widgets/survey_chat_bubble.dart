import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyChatBubble extends StatelessWidget {
  final name;
  final time;
  final chat;
  final picUrl;

  const SurveyChatBubble(this.name, this.time, this.chat, this.picUrl);

  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 55,
              width: 55,
              child: Image.network(picUrl),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                          color: _colors.appDarkIndigo,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      time,
                      style: GoogleFonts.montserrat(
                          color: _colors.appDarkIndigo,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Text(
                  chat,
                  style: GoogleFonts.montserrat(
                      color: _colors.appDarkIndigo,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
