import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../podcast/view/audiopodcast.dart';

class PodCast_UI extends StatelessWidget {
  const PodCast_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.to(Audio_Podcast_UI());
        },
        icon: Icon(Icons.podcasts));
  }
}
