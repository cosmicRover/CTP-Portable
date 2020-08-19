import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingSessions extends StatelessWidget {
  ///this will be an array of items
  final sessionDate;
  final sessionTitle;
  final sessionDetail;

  const UpcomingSessions(
      this.sessionDate, this.sessionTitle, this.sessionDetail);

  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                height: 157,
                decoration: BoxDecoration(
                    color: _colors.appDarkIndigo,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 26, left: 15),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/cal.png",
                                width: 69,
                                height: 74,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                sessionDate,
                                style: GoogleFonts.montserrat(
                                    color: _colors.appPink,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                sessionTitle,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    color: _colors.appLightBlue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                sessionDetail,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
          );
        });
  }
}
