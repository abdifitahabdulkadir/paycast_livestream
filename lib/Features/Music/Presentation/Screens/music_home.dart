import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import '/Core/Constants/dummy_videos_links.dart';
import '/Core/Components/category_title.dart';
import '/Features/Music/Presentation/Components/music_item.dart';

import '/Core/Constants/colors.dart';

class MusicHome extends StatefulWidget {
 
  const MusicHome({super.key});

  @override
  State<MusicHome> createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  final musicImageUrl = "asset/music_images/musicImageOne.png";
  late FlutterListViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlutterListViewController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _eachMovieItemDesign(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    AppColors.musicGraidentColorOne,
                    AppColors.musicGraidentColorTwo,
                  ]),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 26, top: 16),
                child: Image.asset(
                  musicImageUrl,
                  height: 326,
                  width: 321,
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 360),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ChilHop",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Blissed out beats and head nodding grooves - Relax, study and vibe.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "46,269 likes201 songs - about 7 hr 30 min",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.appBackgroundColor,
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            _eachMovieItemDesign(context),
            CategoryTitle(title: "Drama"),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: SizedBox(
                  height: 300,
                  child: FocusTraversalOrder(
                    order: NumericFocusOrder(0),
                    child: FlutterListView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      delegate: FlutterListViewDelegate(
                        childCount: MusicImageUrls.musicImageUrls.length,
                        (context, index) =>
                            FocusableControlBuilder(builder: (context, state) {
                          if (state.isFocused &&
                              _controller.position.pixels !=
                                  _controller.position.maxScrollExtent) {
                            _controller.sliverController.jumpToIndex(index);
                            _controller.sliverController.ensureVisible(index);
                          }  
                          return MusicItem(
                              isFocused: state.isFocused,
                              imageUrl: MusicImageUrls.musicImageUrls[index],
                              musicName: MusicImageUrls.musicName[index]);
                        }),
                      ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}
