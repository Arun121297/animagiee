import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Emogie_Description_UI extends StatefulWidget {
  const Emogie_Description_UI({Key? key}) : super(key: key);

  @override
  State<Emogie_Description_UI> createState() => _Emogie_Description_UIState();
}

class _Emogie_Description_UIState extends State<Emogie_Description_UI> {
  List emogi = [
    "images/emogi_1.png",
    "images/emoji_2.png",
    "images/emoji_3.png",
    "images/emoji_4.png",
    "images/emoji_5.png",
    "images/emoji_6.png",
    "images/emoji_7.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      height: 160,
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Card(
            elevation: 4,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Add your Description Here",
                style: GoogleFonts.poppins(
                  height: 3,
                  textStyle: TextStyle(
                    fontSize: 9.0.sp,
                    color: descriptionText_CL,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              height: 120,
              width: 339,
              decoration: BoxDecoration(
                  // border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Align(
            heightFactor: 4,
            // alignment: Alignment.center,
            child: Container(
              height: 54,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: emogi.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  width: 30,
                  child: Image.asset(emogi[index]),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
