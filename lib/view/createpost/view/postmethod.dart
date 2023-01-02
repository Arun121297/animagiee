import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

// enum BestTutorSite { Individual, Group }

class Post_Method_UI extends StatefulWidget {
  const Post_Method_UI({Key? key}) : super(key: key);

  @override
  State<Post_Method_UI> createState() => _Post_Method_UIState();
}

class _Post_Method_UIState extends State<Post_Method_UI> {
  PostController controller = Get.find();
  // Controller controller = Get.put(Controller());

  // BestTutorSite site = BestTutorSite.Individual;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 3,
              child: SizedBox(
                height: 6.0.hp,
                //  45,
                width: 45.0.wp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.person,
                      color: animagiee_CL,
                    ),
                    Text(
                      "Individual",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.0.sp,
                          color: descriptionText_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Radio(
                      value: "single",
                      groupValue: controller.postType.value,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black), //<-- SEE HERE
                      onChanged: (value) {
                        // controller.post_absorbing_bool.value = true;
                        controller.postType("single");
                        // site = BestTutorSite.Individual;
                      },
                    ),
                  ],
                ),
                //  150,
              )),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 3,
              child: SizedBox(
                height: 6.0.hp,
                //  45,
                width: 45.0.wp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 3.0.hp,
                      //  19,
                      width: 8.0.wp,
                      //  19,
                      child: Image.asset("images/grouppost.png"),
                    ),
                    Text(
                      "Group",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.0.sp,
                          color: descriptionText_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Radio(
                      value: "group",
                      groupValue: controller.postType.value,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black), //<-- SEE HERE
                      onChanged: (value) {
                        controller.postType("group");
                      },
                    ),
                  ],
                ),
                //  150,
              ))
        ],
      ),
    );
  }
}
