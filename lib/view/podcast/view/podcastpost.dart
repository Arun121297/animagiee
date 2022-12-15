import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/controller.dart';

class PodCast_Creating_Group_UI extends StatefulWidget {
  const PodCast_Creating_Group_UI({Key? key}) : super(key: key);

  @override
  State<PodCast_Creating_Group_UI> createState() =>
      _PodCast_Creating_Group_UIState();
}

class _PodCast_Creating_Group_UIState extends State<PodCast_Creating_Group_UI> {
  Controller controller = Get.put(Controller());
  String fromdropdownValue = "Podcast-1 Group";
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
        elevation: 3,
        child: Stack(children: [
          Container(
            height: 8.0.hp,
            //  60,
            width: 94.0.wp,
            //  339,
            // color: Colors.green,
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              dropdownColor: Colors.grey.shade300,
              isExpanded: true,
              value: fromdropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              elevation: 16,
              style: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1)),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  fromdropdownValue = newValue!;
                });
              },
              items: <String>[
                "Podcast-1 Group",
                "Podcast-2 Group",
                "Podcast-3 Group",
                "Podcast-4 Group"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 6.0.hp,
                            //  45,
                            width: 12.0.wp,
                            // 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0.sp),
                              image: DecorationImage(
                                scale: 1.0,
                                image: AssetImage("images/profilephotos.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            value,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }).toList(),
            ),
            //  Row(children: [
            //   Container(
            //     height: 6.0.hp, //  45,
            //     width: 12.0.wp,
            //     // 55,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0.sp),
            //       image: DecorationImage(
            //         image: AssetImage("images/profilephotos.jpg"),
            //       ),
            //     ),
            //   ),
            //   Text(
            //     "Arun's Group",
            //     style: GoogleFonts.poppins(
            //       textStyle: TextStyle(
            //         fontSize: 9.0.sp,
            //         color: Colors.black,
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            //   Expanded(child: Container()),
            //   Icon(Icons.keyboard_arrow_down),
            //   SizedBox(
            //     width: 12,
            //   )
            // ]),
          ),
          Obx(() {
            return Visibility(
              visible: controller.podcastposttype_bool.value,
              child: Container(
                height: 8.0.hp,
                //  60,
                width: 94.0.wp,
                //  339,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0.sp),
                  color: Colors.black54,
                ),
              ),
            );
          })
        ]),
      ),
    );
  }
}
