import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Constants/arrow_intents.dart';
import 'package:movie_app/Core/Constants/colors.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  final videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4";
  final todayGame = "https://www.youtube.com/watch?v=VFF2fhVyT8E";
  final assetUrl = "asset/movie_images/test_video/sample.mp4";
  late final PodPlayerController controller;
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    controller = PodPlayerController(
        podPlayerConfig: PodPlayerConfig(),
        playVideoFrom: PlayVideoFrom.youtube(todayGame))
      ..initialise();
    super.initState();

    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: "VFF2fhVyT8E",
      flags: YoutubePlayerFlags(
        isLive: true,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _errorBuilder() => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.appBarColor.withOpacity(0.3),
        ),
        child: Text(
          "We are facing Error please Press \"1\" to refresh ",
          style: GoogleFonts.roboto(
            fontSize: 20,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  PodProgressBarConfig _progressBarConfig() => PodProgressBarConfig(
        alwaysVisibleCircleHandler: true,
        backgroundColor: AppColors.whiteColor,
        bufferedBarColor: AppColors.whiteColor,
        circleHandlerRadius: 10,
        circleHandlerColor: AppColors.appBarColor,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 5,
        playingBarColor: AppColors.appBarColor,
        curveRadius: 6,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: _youtubePlayerController,
              aspectRatio: 16 / 9,
              liveUIColor: AppColors.appBarColor,
            ),
          ),
          Container(
            height: 300,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  getPodayPlayer() {
    return FocusableControlBuilder(
        autoFocus: true,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.enter): EnterButtonIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): RightArrowIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): LeftArrowIntent(),
        },
        actions: {
          EnterButtonIntent: CallbackAction(
            onInvoke: (intent) {
              controller.togglePlayPause();
              return;
            },
          ),
          RightArrowIntent: CallbackAction(
            onInvoke: (intent) {
              var jumpTo = Duration(
                  seconds: controller.currentVideoPosition.inSeconds + 10);
              controller.videoSeekTo(jumpTo);
              return;
            },
          ),
          LeftArrowIntent: CallbackAction(
            onInvoke: (intent) {
              int getCurrentSeconds = controller.currentVideoPosition.inSeconds;
              if (getCurrentSeconds > 10) {
                var jumpTo = Duration(
                    seconds: controller.currentVideoPosition.inSeconds - 10);
                controller.videoSeekTo(jumpTo);
                return;
              }

              return;
            },
          ),
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              border: state.isFocused
                  ? Border.all(color: AppColors.whiteColor, width: 2)
                  : Border.all(color: AppColors.appBackgroundColor, width: 1),
            ),
            child: PodVideoPlayer(
              backgroundColor: AppColors.appBarColor.withOpacity(0.1),
              podProgressBarConfig: _progressBarConfig(),
              onVideoError: _errorBuilder,
              videoTitle:
                  Text("Somalia somalia somalia somali somalia somalia"),
              controller: controller,
            ),
          );
        });
  }
}
