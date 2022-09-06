import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Album_Header_UI extends StatefulWidget {
  const Album_Header_UI({Key? key}) : super(key: key);

  @override
  State<Album_Header_UI> createState() => _Album_Header_UIState();
}

class _Album_Header_UIState extends State<Album_Header_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 31.0.hp,
      //  234,
      child: Stack(children: [
        Container(
          height: 29.0.hp,
          // 219,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/podcastimage.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (controller.podcastplayblutton.value == true) {
                controller.podcastplayblutton.value = false;
              } else {
                controller.podcastplayblutton.value = true;
              }
            });
          },
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 5.0.hp,
              // 35,
              width: 31.0.wp,
              // 119,
              margin: EdgeInsets.only(left: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: animagiee_CL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Play All",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      "images/playbutton.png",
                      // cacheHeight: 25,
                      // cacheWidth: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
