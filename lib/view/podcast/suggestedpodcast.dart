import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

class Suggested_PodCast_UI extends StatefulWidget {
  const Suggested_PodCast_UI({Key? key}) : super(key: key);

  @override
  State<Suggested_PodCast_UI> createState() => _Suggested_PodCast_UIState();
}

class _Suggested_PodCast_UIState extends State<Suggested_PodCast_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      scrollDirection: Axis.vertical,
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 5,
            ),
            Container(
              height: 70,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      "images/podcastdog.png",
                    ),
                  )),
            ),
            SizedBox(
              width: 10,
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
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                    height: 35,
                    width: 119,
                    margin: EdgeInsets.only(left: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
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
        height: 76,
        width: MediaQuery.of(context).size.width,
        color: podcastcolor_1_CL,
      ),
    );
  }
}
