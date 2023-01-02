import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'postcreation.dart';

class CreatePost extends StatefulWidget {
  CreatePost({Key? key, required this.profileImage}) : super(key: key);
  String? profileImage;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const Post());
      },
      child: Container(
        height: 9.0.hp,
        //  83,
        color: Colors.white70,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 5.0.wp,
            ),
            widget.profileImage!.isNotEmpty
                ? CircleAvatar(
                    backgroundImage: NetworkImage(widget.profileImage ?? ""))
                : const CircleAvatar(
                    backgroundImage: ExactAssetImage("images/Fishes.jpg")),
            const VerticalDivider(color: Colors.transparent, width: 13),
            Container(
                width: 60.0.wp,
                // 218,
                height: 6.0.hp,
                // 43,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    )),
                child: Text(
                  "  Write something here...",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: TextContent3_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            SizedBox(
              width: 3.0.wp,
            ),
            // VerticalDivider(color: Colors.transparent, width: 13),
            SizedBox(
                height: 5.0.hp,
                width: 7.0.wp,
                child: Image.asset("images/photovideos.png")),
            SizedBox(
              width: 5.0.wp,
            ),
          ],
        ),
      ),
    );
  }
}
