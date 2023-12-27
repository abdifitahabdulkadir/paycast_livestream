import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  final double? myWidth;
  final double? myHeight;
  const AppSpacer({super.key, required this.myHeight, required this.myWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myHeight,
      width: myWidth,
    );
  }
}
