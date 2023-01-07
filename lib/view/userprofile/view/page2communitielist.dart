import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/communiti_userList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../animagieeprofile/view/animalsprofiles.dart';

class Page2_Communitie_List extends StatefulWidget {
  String name;
  String icon;
  String id;
  String userId;
  Page2_Communitie_List(
      {required this.name,
      required this.icon,
      required this.id,
      required this.userId});
  @override
  State<Page2_Communitie_List> createState() => _Page2_Communitie_ListState();
}

class _Page2_Communitie_ListState extends State<Page2_Communitie_List> {
  var sampleimage = "images/Cats.jpg";
  CommunitiPostListController communitiPostListController = Get.find();

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Animals_Profiles_UI(
          id: widget.id,
        ));
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.icon),
              ),
            ),
            Text(widget.name),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (visible == false) {
                    visible = true;
                  } else {
                    visible = false;
                  }
                });
              },
              child: Container(
                height: 26,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: animagiee_CL),
                child: Text(
                  visible == false ? "Join" : "Joined",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
