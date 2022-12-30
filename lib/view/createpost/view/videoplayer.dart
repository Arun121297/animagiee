// import 'dart:io';

// import 'package:animagieeui/view/homepage/controller/homescreen1controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:video_player/video_player.dart';

// import '../../../controller/controller.dart';

// class Video_Player extends StatefulWidget {
//   Video_Player({Key? key, required this.urls}) : super(key: key);
//   String urls;
//   @override
//   State<Video_Player> createState() => _Video_PlayerState();
// }

// class _Video_PlayerState extends State<Video_Player> {
//   UserPostListController userPostListController = Get.find();
//   VideoPlayerController? controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.network(
//       widget.urls,
//     )..initialize();

//     // controller.videocontroller!.play();

//     // controller.videocontroller!.setVolume(0);
//     // controller.videocontroller?.setLooping(true);
//   }

//   @override
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (controller!.value.isPlaying) {
//             // pause
//             controller!.pause();
//             print("pause::::");
//           } else {
//             // play
//             print("play::::");

//             controller!.play();
//           }
//         });
//       },
//       child: AspectRatio(
//         aspectRatio: 1,
//         child: VideoPlayer(controller!),
//       ),
//     );
//   }
// }
