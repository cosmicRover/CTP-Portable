import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileView extends StatelessWidget {
  final height;
  final name;
  final track;
  final picUrl;
  final cohort;
  final percentage;

  const ProfileView(this.height, this.name, this.track, this.picUrl,
      this.cohort, this.percentage);
  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();
    final _width = MediaQuery.of(context).size.width;

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
              alignment: Alignment.bottomLeft,
              child: Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cohort $cohort",
                          style: GoogleFonts.montserrat(
                              color: _colors.appDarkIndigo,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          track,
                          style: GoogleFonts.montserrat(
                              color: _colors.appDarkIndigo,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        LinearPercentIndicator(
                          width: _width - 60,
                          lineHeight: 16.0,
                          percent: percentage / 100,
                          progressColor: _colors.appLightBlue,
                        ),
                      ],
                    ),
                  ))),
        ],
      ),
    );
  }
}
