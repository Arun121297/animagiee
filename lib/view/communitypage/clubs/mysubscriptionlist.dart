import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../animagieeprofile/animalsprofiles.dart';

class My_Sub_List_Content extends StatefulWidget {
  var fetchindex;
  My_Sub_List_Content({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<My_Sub_List_Content> createState() => _My_Sub_List_ContentState();
}

class _My_Sub_List_ContentState extends State<My_Sub_List_Content> {
  Controller controller = Get.put(Controller());
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Get.to(Animals_Profiles_UI());
          });
        },
        child: Card(
          child: SizedBox(
            height: 7.0.hp,
            // 56,
            child: Row(
              children: [
                SizedBox(
                  width: 6.0.wp,
                  //  16,
                ),
                CircleAvatar(
                  backgroundImage: ExactAssetImage(
                      controller.communitylistimage[widget.fetchindex]),
                ),
                SizedBox(width: 4.0.wp
                    //  13,
                    ),
                Text(controller.communitylist[widget.fetchindex]),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    print(controller.communitylist.length);
                    setState(() {
                      if (visibility == false) {
                        visibility = true;
                      } else {
                        visibility = false;
                      }
                    });
                  },
                  child: Container(
                    height: 3.5.hp,
                    //  26,
                    width: 24.0.wp,
                    // 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.circular(5.0.sp)),
                    child: Text(
                      visibility == true ? "Joined" : "Request",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3.0.wp
                    // 12,
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
