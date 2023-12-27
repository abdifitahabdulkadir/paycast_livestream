import 'package:flutter/material.dart';
import 'package:movie_app/Core/Constants/colors.dart';

class ContinueWatchItem extends StatelessWidget {
  final String imageUrl;
  final bool isFocused;

  const ContinueWatchItem({
    super.key,
    required this.imageUrl,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: isFocused
            ? Border.all(color: AppColors.whiteColor, width: 3)
            : null,
      ),
      child: Stack(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              alignment: Alignment.center,
              width: 200,
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topRight,
                    colors: [
                      AppColors.continueWatchColorOne,
                      AppColors.continueWatchColorTwo,
                    ]),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 6,
              width: 150,
              margin: EdgeInsets.only(bottom: 100, left: 15, right: 15),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 6,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.appBarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
