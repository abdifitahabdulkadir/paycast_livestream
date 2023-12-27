import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Constants/colors.dart';
import 'package:movie_app/Core/Components/app_spacer.dart';

class MusicItem extends StatelessWidget {
  final String imageUrl;
  final String musicName;
  final isFocused;
  const MusicItem({
    super.key,
    required this.imageUrl,
    required this.musicName,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: 250,
      width: isFocused ? 270 : 260,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: isFocused
            ? Border.all(color: AppColors.whiteColor, width: 3)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.appBackgroundColor.withOpacity(0.4),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.play_circle,
                    color: AppColors.appBarColor,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          AppSpacer(myHeight: 10, myWidth: 0),
          Text(
            musicName,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
