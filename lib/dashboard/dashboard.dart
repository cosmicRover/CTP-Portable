import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/supporting_widgets/profile_view.dart';
import 'package:ctpportable/supporting_widgets/top_sheet.dart';
import 'package:ctpportable/supporting_widgets/view_frames.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final _appColor = AppColors();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ProfileView(_height / 2, "Alex", "Web",
              "https://www.thespruce.com/thmb/Scxki-aqbP8Q0UsnoIMTPd5n98w=/1500x1000/filters:fill(auto,1)/blue-jay-2-5991e6b0c412440011b66974.jpg"),
          ViewFrames(),
        ],
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
