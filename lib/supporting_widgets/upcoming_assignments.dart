import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingAssignments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 90,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
                width: 140,
                decoration: BoxDecoration(
                    color: _colors.appDarkIndigo,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 20),
                      child: Text(
                        "Due 08/31",
                        style: GoogleFonts.montserrat(
                            color: _colors.appPink,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "CTP Completion Form",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, bottom: 8),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 44.0,
                        ),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
