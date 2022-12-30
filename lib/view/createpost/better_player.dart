import 'package:animagieeui/view/homepage/controller/homescreen1controller.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BetterVideoPlayer extends StatefulWidget {
  String url;
  BetterVideoPlayer({required this.url});

  @override
  State<BetterVideoPlayer> createState() => _BetterVideoPlayerState();
}

class _BetterVideoPlayerState extends State<BetterVideoPlayer> {
  late BetterPlayerController betterPlayerController;
  late BetterPlayerDataSource betterPlayerDataSource;

  BetterPlayerControlsConfiguration betterPlayerControlsConfiguration =
      BetterPlayerControlsConfiguration.cupertino();
  UserPostListController userPostListController = Get.find();

  @override
  void initState() {
    betterPlayerControlsConfiguration = BetterPlayerControlsConfiguration(
        controlBarColor: Colors.black.withOpacity(0.5),
        enableOverflowMenu: false,
        enableFullscreen: false,
        enableSkips: false,
        enableProgressBar: false,
        // enableAudioTracks: false,
        playIcon: Icons.play_circle,
        skipBackIcon: Icons.fast_rewind_rounded,
        skipForwardIcon: Icons.fast_forward_rounded);
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      controlsConfiguration: betterPlayerControlsConfiguration,
      aspectRatio: 1,
      fit: BoxFit.contain,
      autoPlay: true,
      // looping: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
    );
    betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.url);
    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(betterPlayerDataSource);
    // BetterPlayerFormat:
    // BetterPlayerBetterPlayerFormat.hls;
    super.initState();
  }

  @override
  void dispose() {
    betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 0.8 / 1,
        child: BetterPlayer(
          controller: betterPlayerController,
        ),
      ),
    );
  }
}
