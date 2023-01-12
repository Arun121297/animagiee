import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../podcast/view/audiopodcast.dart';

class PodCast_UI extends StatelessWidget {
  const PodCast_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return IconButton(
    //     onPressed: () {
    //       // Get.to();
    //       Get.to(Audio_Podcast_UI());
    //     },
    //     icon: Icon(Icons.podcasts));
    
    return GestureDetector(
      onTap: () {
        Get.to(Audio_Podcast_UI());
      },
      child: SizedBox(
        height: 5.5.hp,
        width: 5.5.wp,
        child: Image.asset("images/podcast_icon.png"),
      ),
    );
  }
}
