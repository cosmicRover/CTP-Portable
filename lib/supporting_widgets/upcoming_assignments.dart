import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/dashboard/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingAssignments extends StatelessWidget {
  final List<DashboardSessions> assignments;

  const UpcomingAssignments(this.assignments);

  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: assignments.length,
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
                        assignments[index].due.toString(),
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
                          assignments[index].name.toString(),
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
