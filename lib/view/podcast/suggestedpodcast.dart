import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

class Suggested_PodCast_UI extends StatefulWidget {
  Suggested_PodCast_UI({Key? key}) : super(key: key);

  @override
  State<Suggested_PodCast_UI> createState() => _Suggested_PodCast_UIState();
}

class _Suggested_PodCast_UIState extends State<Suggested_PodCast_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 5,
          ),
          Container(
            height: 10.0.hp,
            //  70,
            width: 19.0.wp,
            //  65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.sp),
                image: DecorationImage(
                  image: AssetImage(
                    "images/podcastdog.png",
                  ),
                )),
          ),
          SizedBox(
            width: 4.0.wp,
            //  10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Doggiee song",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 8.5.sp,
                    // color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "4:20",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 7.5.sp,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
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
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(left: 35.0.sp),
                child: Container(
                  height: 5.0.hp,
                  // 35,
                  width: 30.0.wp,
                  // 119,
                  margin: EdgeInsets.only(left: 35.0.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0.sp),
                          bottomLeft: Radius.circular(20.0.sp)),
                      color: animagiee_CL),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Play ",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.0.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0.hp,
                        //  25,
                        width: 7.0.wp,
                        // 25,
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
            ),
          )
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       if (controller.podcastplayblutton.value == true) {
          //         controller.podcastplayblutton.value = false;
          //       } else {
          //         controller.podcastplayblutton.value = true;
          //       }
          //     });
          //   },
          //   child: Container(
          //     // color: Colors.purple,
          //     height: 35,
          //     width: 180,
          //     alignment: Alignment.centerRight,
          //     child: Image.asset(
          //       "images/play.png",
          //       cacheHeight: 35,
          //       cacheWidth: 119,
          //     ),
          //   ),
          // )
        ],
      ),
      height: 8.0.hp,
      // 76,
      width: MediaQuery.of(context).size.width,
      color: podcastcolor_1_CL,
    );
  }
}
