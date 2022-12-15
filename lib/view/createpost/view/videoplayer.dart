import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../../../controller/controller.dart';

class Video_Player extends StatefulWidget {
  Video_Player({Key? key, required this.urls}) : super(key: key);
  String urls;
  @override
  State<Video_Player> createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    controller.videocontroller = VideoPlayerController.file(
      File(widget.urls),
    )..initialize();

    controller.videocontroller!.play();

    controller.videocontroller!.setVolume(0);
    controller.videocontroller?.setLooping(true);
  }

  @override
  void dispose() {
    controller.videocontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (controller.videocontroller!.value.isPlaying) {
            // pause
            controller.videocontroller!.pause();
            print("pause::::");
          } else {
            // play
            print("play::::");

            controller.videocontroller!.play();
          }
        });
      },
      child: AspectRatio(
        aspectRatio: controller.videocontroller!.value.aspectRatio,
        child: VideoPlayer(controller.videocontroller!),
      ),
    );
  }
}
