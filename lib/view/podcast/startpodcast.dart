import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config/colorconfig.dart';
import '../createpost/adddescription.dart';

import '../createpost/creategroup.dart';

import '../createpost/postmethod.dart';

import 'audiopodcast.dart';
import 'networktimer.dart';

class Start_Your_Podcast_UI extends StatefulWidget {
  const Start_Your_Podcast_UI({Key? key}) : super(key: key);

  @override
  State<Start_Your_Podcast_UI> createState() => _Start_Your_Podcast_UIState();
}

class _Start_Your_Podcast_UIState extends State<Start_Your_Podcast_UI> {
  bool passplay = false;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.podcastapp("Audio Podcast", Audio_Podcast_UI(), context),
            Expanded(
                child: SingleChildScrollView(
                    child: SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.0.hp,
                      //  22,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Post Type"),
                    ),
                    SizedBox(
                      height: 1.0.hp,
                      //  12,
                    ),
                    Post_Method_UI(),
                    SizedBox(
                      height: 2.0.hp,
                      // 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Select group"),
                    ),
                    SizedBox(
                      height: 1.5.hp,
                      // 12,
                    ),
                    Create_Post_UI(),
                    SizedBox(
                      height: 2.0.hp,
                      // 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Add_Photos_UI(), Add_Video_UI()
                        addAudio(),
                        addImage()
                      ],
                    ),
                    SizedBox(
                      height: 0.5.hp, //  8,
                    ),
                    Emogie_Description_UI(),
                    SizedBox(
                      height: 5.0.hp,
                      // 80,
                    ),

                    // SizedBox(
                    //   height: 50,
                    // ),

                    Timer(),
                    SizedBox(
                      height: 7.0.hp,
                      //  40,
                    ),
                    Align(
                      child: controller.communityNext("Post", null),
                      alignment: Alignment.center,
                    ),
                    // Post_Button_UI()
                  ]),
            )))
          ],
        ),
      ),
    );
  }

  addAudio() {
    return Material(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // filepicker();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.music_note,
                  color: animagiee_CL,
                ),
                Text("Add Audio"),
              ],
            ),
            height: 6.0.hp,
            // 45,
            width: 40.0.wp,
            // 150,
          ),
        ));
  }

  addImage() {
    return Material(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() {
              // filepicker();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.image,
                  color: animagiee_CL,
                ),
                Text("Add Image"),
              ],
            ),
            height: 6.0.hp,
            // 45,
            width: 40.0.wp,
            // 150,
          ),
        ));
  }
}
