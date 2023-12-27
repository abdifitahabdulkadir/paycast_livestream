import 'package:flutter/material.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Core/Constants/colors.dart';
import '../Components/game_design.dart';

class SportsGames extends StatelessWidget {
  const SportsGames({super.key});
  final imagUlr = "asset/Sport_images/sport_banner.png";

  Widget _buildBanner(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagUlr),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.continueWatchColorOne.withOpacity(0.1),
                  AppColors.continueWatchColorTwo.withOpacity(0.9),
                ]),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(left: 20, top: 17),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.activeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 60,
              width: 200,
              child: Row(
                children: [
                  Text(
                    "Watch Now",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.play_circle,
                    color: AppColors.whiteColor,
                    size: 40,
                  ),
                ],
              )),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 50),
            child: Text(
              "Real Vs Barcelona",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 36,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.appBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: _buildBanner(context),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  "Live Sports",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    children: [
                      FocusableControlBuilder(builder: (context, state) {
                        return GameDesign(
                          isFocused: state.isFocused,
                          channelNumber: 1,
                        );
                      }),
                      FocusableControlBuilder(builder: (context, state) {
                        return GameDesign(
                          isFocused: state.isFocused,
                          channelNumber: 2,
                        );
                      }),
                      FocusableControlBuilder(builder: (context, state) {
                        return GameDesign(
                          isFocused: state.isFocused,
                          channelNumber: 3,
                        );
                      }),
                      FocusableControlBuilder(builder: (context, state) {
                        return GameDesign(
                          isFocused: state.isFocused,
                          channelNumber: 4,
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
