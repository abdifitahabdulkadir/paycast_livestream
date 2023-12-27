import 'package:flutter/material.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Features/Movie/Presentation/Screens/movie_home.dart';
import 'package:movie_app/Features/Music/Presentation/Screens/music_home.dart';
import 'package:movie_app/Features/Sports/Presentation/Screens/sports_games.dart';

import '../Core/Constants/colors.dart';

enum TabNames {
  moive,
  sport,
  music,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  int currentActivePage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: 1,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _getContainerDesing(String text, IconData icon, bool isFocused) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: isFocused
              ? AppColors.activeColor
              : AppColors.appBackgroundColor.withOpacity(0.11111),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: AppColors.whiteColor,
            size: 17,
          ),
          title: Text(
            text,
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: AppColors.whiteColor),
          ),
        ));
  }

  final style = GoogleFonts.jetBrainsMono(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus();
    return FocusScope(
      child: Scaffold(
        backgroundColor: AppColors.appBackgroundColor,
        body: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Row(
            children: [
              FocusTraversalOrder(
                order: NumericFocusOrder(1),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.continueWatchColorOne,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  width: 160,
                  child: FocusTraversalGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FocusableControlBuilder(builder: (context, state) {
                          if (state.isFocused) {
                            _controller.animateToPage(0,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear);
                          }
                          return _getContainerDesing(
                              "Movies", Icons.movie, state.isFocused);
                        }),
                        FocusableControlBuilder(builder: (context, state) {
                          if (state.isFocused) {
                            _controller.animateToPage(1,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear);
                          }
                          return _getContainerDesing("Sport",
                              Icons.sports_baseball_sharp, state.isFocused);
                        }),
                        FocusableControlBuilder(builder: (context, state) {
                          if (state.isFocused) {
                            _controller.animateToPage(2,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear);
                          }
                          return _getContainerDesing(
                              "Music", Icons.music_note, state.isFocused);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              FocusTraversalOrder(
                order: NumericFocusOrder(2),
                child: Expanded(
                    child: PageView(
                  controller: _controller,
                  children: [
                    MovieHome(),
                    SportsGames(),
                    MusicHome(),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
