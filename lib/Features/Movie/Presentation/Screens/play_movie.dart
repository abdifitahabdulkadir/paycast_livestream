import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Core/Constants/colors.dart';
import 'package:movie_app/Features/Movie/Controller/movie_controller.dart';
import 'package:pod_player/pod_player.dart';

import '../../../../Core/Constants/arrow_intents.dart';

class PlayMovie extends ConsumerStatefulWidget {
  const PlayMovie({super.key});

  @override
  ConsumerState<PlayMovie> createState() => _PlayMovieState();
}

class _PlayMovieState extends ConsumerState<PlayMovie> {
  late final PodPlayerController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getPodayPlayer(String videoLink) {
    controller =
        PodPlayerController(playVideoFrom: PlayVideoFrom.network(videoLink));
    controller.initialise();
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
              onVideoError: () => _errorBuilder(null),
              videoTitle:
                  Text("Somalia somalia somalia somali somalia somalia"),
              controller: controller,
            ),
          );
        });
  }

  Widget _errorBuilder(String? message) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.appBarColor.withOpacity(0.3),
        ),
        child: Text(
          message ?? "We are facing Error please Press \"1\" to refresh ",
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
      body: ref.watch(movieVideosProvider).when(
            data: (data) => getPodayPlayer(data[0].video_url ?? ""),
            error: (error, _) => _errorBuilder(error.toString()),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
