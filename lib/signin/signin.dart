import 'package:ctpportable/app_constants/app_colors.dart';
import 'package:ctpportable/dashboard/dashboard.dart';
import 'package:ctpportable/services/auth_services.dart';
import 'package:ctpportable/supporting_widgets/login_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  AppColors _appColor = AppColors();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        AuthServices().signInUser.then((isSuccess) {
          if (isSuccess) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          } else {
            print("unable to signin");
          }
        });
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            _appColor.appDarkIndigo,
            _appColor.appDarkIndigoGradient
          ], begin: Alignment.topCenter)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 85),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 300, left: 70),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 360, left: 70),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose an option to login to an existing account.",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 490, left: 65),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: _appColor.appLightBlue)),
                      color: _appColor.appLightBlue,
                      textColor: Colors.red,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        ///this has issues
                      },
                      child: Container(
                        width: 250,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, bottom: 8.0, right: 17),
                              child: Image.asset(
                                "assets/goog.png",
                                height: 23,
                                width: 23,
                              ),
                            ),
                            Text(
                              "Sign in with Google",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
              LoginFrame()
            ],
          ),
        ),
      ),
    );
  }
}
