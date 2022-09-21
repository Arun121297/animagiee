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
      // color: Color.fromRGBO(76, 175, 80, 1),
      height: 25.0.hp,
      // 200,
      child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Card(
            elevation: 3,
            child: Container(
              margin: EdgeInsets.only(left: 15.0.sp),
              child: TextField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration.collapsed(
                    hintStyle: GoogleFonts.poppins(
                      height: 3,
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: descriptionText_CL,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    hintText: 'Add your Description Here'),
              ),
              height: 22.0.hp,
              //  150,
              width: 97.0.wp,
              // 349,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0.sp)),
            ),
          ),
        ),
        Positioned(
          top: 90.0.sp,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Align(
            heightFactor: 4,
            // alignment: Alignment.center,
            child: Container(
              height: 7.0.hp,
              //  150,
              width: 93.5.wp,
              // 349,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0.sp)),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 2,
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: emogi.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(left: 10.0.sp, right: 10.0.sp),
                  // height: 20.0.hp,
                  width: 10.0.wp,
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
