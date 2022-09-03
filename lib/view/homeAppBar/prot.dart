import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../podcast/audiopodcast.dart';

class PodCast_UI extends StatefulWidget {
  const PodCast_UI({Key? key}) : super(key: key);

  @override
  State<PodCast_UI> createState() => _PodCast_UIState();
}

class _PodCast_UIState extends State<PodCast_UI> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.to(Audio_Podcast_UI());
        },
        icon: Icon(Icons.podcasts));
  }
}
