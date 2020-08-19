import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/sessions/sessions_netwrok_call.dart';
import 'package:ctpportable/supporting_widgets/profile_view.dart';
import 'package:ctpportable/supporting_widgets/red_view_frames.dart';
import 'package:ctpportable/supporting_widgets/top_sheet.dart';
import 'package:ctpportable/supporting_widgets/upcoming_assignments.dart';
import 'package:ctpportable/supporting_widgets/upcoming_sessions.dart';
import 'package:ctpportable/supporting_widgets/view_frames.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sessions extends StatefulWidget {
  @override
  _SessionsState createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  final _appColor = AppColors();
  Future<List<SessionsDataModel>> data;

  @override
  Future<void> initState() {
    print("DASHBOARD INIT GETS CALLED");
    data = FetchSessions().fetchSessions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 30),
                  child: Text(
                    "Upcoming \nSessions",
                    style: GoogleFonts.montserrat(
                        color: _appColor.appDarkIndigo,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: UpcomingSessions(snapshot.data),
                ),
                RedViewFrames(),
              ],
            );
          }
          return Center(child: CircularProgressIndicator(),);
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
