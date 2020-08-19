import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/dashboard/user.dart';
import 'package:ctpportable/supporting_widgets/profile_view.dart';
import 'package:ctpportable/supporting_widgets/top_sheet.dart';
import 'package:ctpportable/supporting_widgets/upcoming_assignments.dart';
import 'package:ctpportable/supporting_widgets/view_frames.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _appColor = AppColors();
  Future<User> data;

  @override
  Future<void> initState() {
    print("DASHBOARD INIT GETS CALLED");
    data = FetchUser().fetchUser();

    print(data);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder<User>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ProfileView(
                    _height / 2,
                    snapshot.data.name,
                    snapshot.data.track,
                    snapshot.data.profile_pic_url,
                    snapshot.data.cohort,
                    snapshot.data.percentage_completed),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Upcoming Assignments",
                      style: GoogleFonts.montserrat(
                          color: _appColor.appDarkIndigo,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 264),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 216,
                        child: UpcomingAssignments(
                            snapshot.data.assignments_due_this_week)),
                  ),
                ),
                ViewFrames(),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
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
