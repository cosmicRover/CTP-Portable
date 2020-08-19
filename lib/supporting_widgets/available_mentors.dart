import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/mentors/mentors_network_call.dart';
import 'package:ctpportable/services/email_launch_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableMentors extends StatelessWidget {
  ///this will be an array of items
  final List<MentorsDataModel> data;

  const AvailableMentors(this.data);

  @override
  Widget build(BuildContext context) {
    AppColors _colors = AppColors();

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(data.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(data[index].picUrl)),
                ),
              ),
              Text(
                data[index].name,
                style: GoogleFonts.montserrat(
                    color: _colors.appYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                data[index].position,
                style: GoogleFonts.montserrat(
                    color: _colors.appYellow,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w200),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/mail.png",
                      width: 36,
                    ),
                    onTap: () {
                      EmailLaunchService().launchURL("jpaul3250@gmail.com");
                    },
                  ),
                  SizedBox(
                    width: 11.5,
                  ),
                  Image.asset(
                    "assets/in.png",
                    width: 26,
                  ),
                  GestureDetector(
                    child: SizedBox(
                      width: 11.5,
                    ),
                    onTap: () {
                      EmailLaunchService()
                          .launchURL('https://www.linkedin.com/');
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/slacks.png",
                      width: 30,
                    ),
                    onTap: () {
                      EmailLaunchService().launchURL(
                          'https://app.slack.com/client/T016TJTJSFN/C018Z3YCS5N');
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
