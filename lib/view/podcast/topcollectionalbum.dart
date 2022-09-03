import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/podcast/podcastAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'albumheader.dart';
import 'dogsmusicplay.dart';

class Top_Collection_Album_UI extends StatefulWidget {
  const Top_Collection_Album_UI({Key? key}) : super(key: key);

  @override
  State<Top_Collection_Album_UI> createState() =>
      _Top_Collection_Album_UIState();
}

class _Top_Collection_Album_UIState extends State<Top_Collection_Album_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return Visibility(
            visible: controller.podcastplayblutton.value,
            child: Playing_Music_UI());
      }),
      body: SafeArea(
          child: Column(
        children: [
          PodCast_AppBar_UI(),
          Album_Header_UI(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
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
                        child: Container(
                          // color: Colors.purple,
                          height: 35,
                          width: 180,
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "images/play.png",
                            cacheHeight: 35,
                            cacheWidth: 119,
                          ),
                        ),
                      )
                    ],
                  ),
                  height: 76,
                  width: MediaQuery.of(context).size.width,
                  color: podcastcolor_1_CL,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
