import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Dashboard/home_screen.dart';
import 'package:movie_app/Features/Movie/Presentation/Screens/play_movie.dart';
import '../../../../Core/Constants/arrow_intents.dart';
import '../../../../Core/Constants/firebase_constants.dart';
import '../../Controller/movie_controller.dart';
import '/Core/Constants/dummy_videos_links.dart';

import '../../../../Core/Constants/colors.dart';
import '../../../../Core/Components/app_spacer.dart';

class MovieItemDetail extends ConsumerWidget {
  final String imageUrl;
  final String category;
  const MovieItemDetail({
    super.key,
    required this.imageUrl,
    required this.category,
  });

  _eachMovieItemDesign(BuildContext context, ref) {
    return FocusableControlBuilder(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
        },
        actions: {
          EnterButtonIntent: CallbackAction(
            onInvoke: (intent) {
              ref
                  .watch(movieCategoryProvider.notifier)
                  .update((state) => MovieDocumentIds.release);
              ref
                  .watch(movieSubCollectionIdProvider.notifier)
                  .update((state) => MovieSubCollections.release_videos);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return HomeScreen();
              }));
              return;
            },
          )
        },
        builder: (context, state) {
          print(state.isFocused);
          return Container(
            height: 400,
            margin: EdgeInsets.symmetric(
                horizontal: state.isFocused ? 2 : 0,
                vertical: state.isFocused ? 2 : 0),
            decoration: BoxDecoration(
              border: state.isFocused
                  ? Border.all(color: AppColors.whiteColor, width: 3)
                  : null,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageUrl),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.bottomRight,
                      begin: Alignment.topRight,
                      colors: [
                        AppColors.activeColor.withOpacity(0.1),
                        AppColors.continueWatchColorTwo.withOpacity(0.5),
                      ],
                    ),
                  ),
                ),
                !state.isFocused
                    ? SizedBox()
                    : Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.tabActiveColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.activeColor,
                            foregroundColor: AppColors.whiteColor,
                            // maximumSize: Size(200, 50),
                          ),
                          onPressed: null,
                          icon: Icon(
                            Icons.play_circle,
                            size: 100,
                            color: AppColors.whiteColor,
                          ),
                          label: Text(
                            "Watch Now",
                            style: GoogleFonts.poppins(
                              fontSize: 50,
                              fontStyle: FontStyle.normal,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                state.isFocused
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DETECTIVE KNIGHT: REDEMPTION",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 36,
                                  color: AppColors.whiteColor,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Container(
                                width: 400,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            size: 30,
                                            color: AppColors.whiteColor),
                                        Icon(Icons.star,
                                            size: 30,
                                            color: AppColors.whiteColor),
                                        Icon(Icons.star,
                                            size: 30,
                                            color: AppColors.whiteColor),
                                        Icon(Icons.star,
                                            size: 30,
                                            color: AppColors.whiteColor),
                                        Icon(Icons.star,
                                            size: 30,
                                            color: AppColors.whiteColor),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("2 Hours 23 mins",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.whiteColor,
                                            )),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Icon(Icons.circle,
                                            size: 6,
                                            color: AppColors.whiteColor),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Text(category,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.whiteColor,
                                            )),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Icon(Icons.circle,
                                            size: 6,
                                            color: AppColors.whiteColor),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Text("2023",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              color: AppColors.whiteColor,
                                            )),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Icon(Icons.circle,
                                            size: 6,
                                            color: AppColors.whiteColor),
                                        AppSpacer(myWidth: 10, myHeight: 0),
                                        Text(
                                          "Age: 16+",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                          "custody in New York, Detective James Knight finds himself in the middle of a jailbreak led by The Christmas Bomber, a brutal fanatic whose Santa Claus disciples are terrorizing the city.",
                                          maxLines: 5,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          );
        });
  }

  _buildAcotorimage(String imageUrl) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
  @override
  Widget build(BuildContext context, ref) {
    FocusScope.of(context).requestFocus();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: FocusTraversalGroup(
        child: ListView(
          children: [
            _eachMovieItemDesign(context, ref),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ActorImageUrls.actionImageUrls.length,
                itemBuilder: (context, index) =>
                    _buildAcotorimage(ActorImageUrls.actionImageUrls[index]),
              ),
            ),
            AppSpacer(myHeight: 20, myWidth: 0),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                "About Detective Knight: Redemption",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.whiteColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Genre",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "Action & Thriller",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  AppSpacer(myHeight: 0, myWidth: 30),
                  Container(
                    width: 200,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.whiteColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Audio & Subtitles",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "Audio : English",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppSpacer(myHeight: 20, myWidth: 0),
            ListTile(
              title: Text(
                "Release Year",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "2022",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            AppSpacer(myHeight: 30, myWidth: 0),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              subtitle: SizedBox(
                width: 80,
                child: Text(
                  "In custody in New York, Detective James Knight finds himself in the middle of a jailbreak led by The Christmas Bomber, a brutal fanatic whose Santa Claus disciples are terrorizing the city. With the promised return of his badge in exchange for taking out the terrorists, the steely-eyed Knight doles out mercy for the just...and merciless justice for all the rest.",
                  maxLines: 10,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.5,
                    fontStyle: FontStyle.normal,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
            AppSpacer(myHeight: 30, myWidth: 0),
          ],
        ),
      ),
    );
  }
}
