import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Post_Button_UI extends StatefulWidget {
  const Post_Button_UI({Key? key}) : super(key: key);

  @override
  State<Post_Button_UI> createState() => _Post_Button_UIState();
}

class _Post_Button_UIState extends State<Post_Button_UI> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          // Get.to(Animals_Profiles_UI());
        },
        child: Container(
          height: 6.0.hp,
          //  43,
          width: 90.0.wp,
          // 310,
          decoration: BoxDecoration(
              color: Color(0xff272727),
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Text(
            "Post",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
