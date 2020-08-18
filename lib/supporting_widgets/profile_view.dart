import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  final height;
  final name;
  final track;
  final picUrl;

  const ProfileView(this.height, this.name, this.track, this.picUrl);
  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return Container(
      height: height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 85.0, left: 30.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hi $name!",
                  style: GoogleFonts.montserrat(
                      color: _colors.appDarkIndigo,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                height: 132,
                width: 132,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(picUrl))),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height / 3.5,
              child: Stack(
                children: [Placeholder()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
