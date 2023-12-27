import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Constants/colors.dart';

class GameDesign extends StatelessWidget {
  final bool isFocused;
  final int channelNumber;
  const GameDesign(
      {super.key, required this.isFocused, required this.channelNumber});
  final gameImageUrl = "asset/Sport_images/eachgame.png";
  final teamOneImageUrl = "asset/Sport_images/team1.png";
  final teamTwoImageUrl = "asset/Sport_images/team2.png";

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: isFocused ? 365 : 360,
        width: 360,
        alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
          
          color: AppColors.musicGradietRedColor,
          borderRadius: BorderRadius.circular(20),
          border: isFocused
              ? Border.all(color: AppColors.whiteColor, width: 4)
              : Border.all(
                  color: const Color.fromARGB(255, 31, 31, 31), width: 2),
        ),
        child: Text(
          "Paycast Channel $channelNumber",
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            
          ),
        )
     
    );
  }
}
