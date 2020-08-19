import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/supporting_widgets/blue_view_frame.dart';
import 'package:ctpportable/supporting_widgets/chat_bar.dart';
import 'package:ctpportable/supporting_widgets/chat_bubble.dart';
import 'package:ctpportable/supporting_widgets/survey_chat_bubble.dart';
import 'package:ctpportable/supporting_widgets/top_sheet.dart';
import 'package:flutter/material.dart';

class StudyGroups extends StatelessWidget {
  final _appColor = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            reverse: true,
            children: [
              SizedBox(
                height: 50,
              ),
              SurveyChatBubble(
                  "Amy",
                  "2:03 am",
                  "What day and time would you guys like to host an online technical interview?",
                  "https://ukulelemeleonmaui.com/blog/wp-content/uploads/2015/09/yellow_bird.jpg"),
              ChatBubble(
                "Amy",
                "2:03 am",
                "We should hold a group technical interview on linked lists and binary trees this week! I'll host a poll.",
                "https://ukulelemeleonmaui.com/blog/wp-content/uploads/2015/09/yellow_bird.jpg",
              ),
              ChatBubble(
                "Bird",
                "2:05 am",
                "Hi guys! I passed by two problems on linked lists and binary trees but it's been so long. :(",
                "https://i.pinimg.com/originals/50/b2/7f/50b27f8cb97494672cbb4f2e6eb0baf6.jpg",
              ),
              ChatBubble(
                "Andy",
                "1:05 am",
                "Need more coffee to keep awake!",
                "https://www.allaboutbirds.org/guide/assets/photo/67385121-480px.jpg",
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: ChatBar()),
          BlueViewFrame(),
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
