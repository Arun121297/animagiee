import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/podcast/topcollectionalbum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'albumheader.dart';

class Top_Collection_Podcast_UI extends StatefulWidget {
  const Top_Collection_Podcast_UI({Key? key}) : super(key: key);

  @override
  State<Top_Collection_Podcast_UI> createState() =>
      _Top_Collection_Podcast_UIState();
}

class _Top_Collection_Podcast_UIState extends State<Top_Collection_Podcast_UI> {
  List poddog = [
    "images/poddog_1.png",
    "images/poddog_2.png",
    "images/poddog_3.png",
    "images/poddog_1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: poddog.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(Top_Collection_Album_UI());
          },
          child: Card(
              child: Container(
            height: 114,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 84,
                  width: 84,
                  child: Image.asset(
                    poddog[index],
                    // cacheHeight: 84,
                    // cacheWidth: 84,
                  ),
                ),
                Text(
                  "Doggiee song",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 7.5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
