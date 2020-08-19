import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/mentors/mentors_network_call.dart';
import 'package:ctpportable/supporting_widgets/available_mentors.dart';
import 'package:ctpportable/supporting_widgets/mentors_view_frames.dart';
import 'package:ctpportable/supporting_widgets/red_view_frames.dart';
import 'package:ctpportable/supporting_widgets/top_sheet.dart';
import 'package:ctpportable/supporting_widgets/upcoming_sessions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mentors extends StatefulWidget {
  @override
  _MentorsState createState() => _MentorsState();
}

class _MentorsState extends State<Mentors> {
  final _appColor = AppColors();

  Future<List<MentorsDataModel>> data;

  @override
  Future<void> initState() {
    print("DASHBOARD INIT GETS CALLED");
    data = FetchMentors().fetchMentors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _appColor.appDarkIndigo,
      body: FutureBuilder<List<MentorsDataModel>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                _appColor.appDarkIndigo,
                _appColor.appDarkIndigoGradient
              ], begin: Alignment.topCenter)),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100, left: 30),
                          child: Text(
                            "Connect with\nthe CUNY Tech Prep Staff!",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 170),
                            child: AvailableMentors(snapshot.data)),
                        MentorsViewFrames(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.menu,
            size: 50.0,
          ),
          backgroundColor: _appColor.appYellow,
          onPressed: () => showGeneralDialog(
            context: context,
            barrierDismissible: true,
            transitionDuration: Duration(milliseconds: 500),
            barrierLabel: MaterialLocalizations.of(context).dialogLabel,
            barrierColor: Colors.black.withOpacity(0.5),
            pageBuilder: (context, _, __) {
              return TopSheetBody();
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ).drive(Tween<Offset>(
                  begin: Offset(1.0, -1.0),
                  end: Offset.zero,
                )),
                child: child,
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
