import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/animagieeprofile/view/animalsprofiles.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
// import 'package:animagieeui/view/communitypage/controller/mysubscriptioncontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MySubScript extends StatefulWidget {
  var fetchindex;
  MySubScript({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<MySubScript> createState() => _MySubScriptState();
}

class _MySubScriptState extends State<MySubScript> {
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  Controller controller = Get.put(Controller());
  MyClubController clubController = Get.find();
  // MySubscriptionController mySubscriptionController =
  //     Get.put(MySubscriptionController());
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Get.to(Animals_Profiles_UI(
              id: '',
            ));
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
                  backgroundImage: NetworkImage(instanceContoroller
                      .communitylistimage[widget.fetchindex]),
                ),
                SizedBox(width: 4.0.wp
                    //  13,
                    ),
                Text(instanceContoroller.communitiesname[widget.fetchindex]),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    print(instanceContoroller.communitylist.length);
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
