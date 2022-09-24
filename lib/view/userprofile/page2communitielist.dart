import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../animagieeprofile/animalsprofiles.dart';

class Page2_Communitie_List extends StatefulWidget {
  const Page2_Communitie_List({Key? key}) : super(key: key);

  @override
  State<Page2_Communitie_List> createState() => _Page2_Communitie_ListState();
}

class _Page2_Communitie_ListState extends State<Page2_Communitie_List> {
  var sampleimage = "images/Cats.jpg";

  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Animals_Profiles_UI());
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage(sampleimage),
              ),
            ),
            Text("Cats"),
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
            SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }
}
