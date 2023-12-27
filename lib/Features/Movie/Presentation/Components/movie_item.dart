import 'package:flutter/material.dart';
import 'package:movie_app/Core/Constants/colors.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String category;
  final bool isFocused;

  const MovieItem({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      height: 250,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
        border: isFocused
            ? Border.all(color: AppColors.whiteColor, width: 4)
            : null,
      ),
    );
  }
}
