import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/podcast/podcastAppbar.dart';
// import 'package:animagieeui/view/podcast/podcasttimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../createpost/adddescription.dart';
import '../createpost/addphotos.dart';
import '../createpost/addvideos.dart';
import '../createpost/creategroup.dart';
import '../createpost/post.dart';
import '../createpost/postmethod.dart';
import '../createpost/tagpeople.dart';
import '../mywork/timer.dart';
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
            // controller.cusapp("Post", context),
            PodCast_AppBar_UI(),
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
                      children: [Add_Photos_UI(), Add_Video_UI()],
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
                    Post_Button_UI()
                  ]),
            )))
          ],
        ),
      ),
    );
  }
}
