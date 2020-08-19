import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/dashboard/dashboard.dart';
import 'package:ctpportable/sessions/sessions.dart';
import 'package:ctpportable/studygroup/study_groups.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSheetBody extends StatelessWidget {
  const TopSheetBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appColor = AppColors();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 291,
          color: Colors.transparent,
          child: Card(
            color: _appColor.appYellow,
            child: Padding(
              padding: const EdgeInsets.only(left: 29.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/home.png",
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 11.25,
                        ),
                        Text(
                          "Dashboard",
                          style: GoogleFonts.montserrat(
                              color: _appColor.appDarkIndigo,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  ),
                  SizedBox(
                    height: 31.0,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/session.png",
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 11.25,
                        ),
                        Text(
                          "Sessions",
                          style: GoogleFonts.montserrat(
                              color: _appColor.appDarkIndigo,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Sessions()));
                    },
                  ),
                  SizedBox(
                    height: 31.0,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/study.png",
                          height: 30.0,
                        ),
                        SizedBox(
                          width: 11.25,
                        ),
                        Text(
                          "Study Groups",
                          style: GoogleFonts.montserrat(
                              color: _appColor.appDarkIndigo,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => StudyGroups()));
                    },
                  ),
                  SizedBox(
                    height: 31.0,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/people.png",
                        height: 30.0,
                        width: 30,
                      ),
                      SizedBox(
                        width: 11.25,
                      ),
                      Text(
                        "Mentors",
                        style: GoogleFonts.montserrat(
                            color: _appColor.appDarkIndigo,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 31.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
