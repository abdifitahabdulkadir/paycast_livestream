import 'package:flutter/material.dart';
import 'package:movie_app/Core/Constants/colors.dart';

class CategoryTitle extends StatelessWidget {
  final String title;

  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      leading: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          color: AppColors.whiteColor,
          fontFamily: "Poppins",
        ),
      ),
      trailing: Text(
        "View All",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.underline,
          color: AppColors.whiteColor,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
