import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Tag_People_UI extends StatefulWidget {
  const Tag_People_UI({Key? key}) : super(key: key);

  @override
  State<Tag_People_UI> createState() => _Tag_People_UIState();
}

class _Tag_People_UIState extends State<Tag_People_UI> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0.sp)),
            height: 6.0.hp,
            // 45,
            width: 120.0.wp,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 4.0.wp,
                  ),
                  SizedBox(
                    height: 3.0.hp,
                    //  21,
                    width: 6.0.wp,
                    // 21,
                    child: Image.asset(
                      "images/tagpeople.png",
                    ),
                  ),
                  SizedBox(
                    width: 2.0.wp,
                    // 10,
                  ),
                  Text(
                    "Tag People",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: descriptionText_CL,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
            // 339,
            ));
  }
}
