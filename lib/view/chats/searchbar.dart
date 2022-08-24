import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class chat_Search_UI extends StatefulWidget {
  const chat_Search_UI({Key? key}) : super(key: key);

  @override
  State<chat_Search_UI> createState() => _chat_Search_UIState();
}

class _chat_Search_UIState extends State<chat_Search_UI> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 90.0.wp,
        // 302,
        height: 5.0.hp,
        // 37,
        // decoration: BoxDecoration(
        //     // color: Colors.green,
        //     borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search User",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 8.0.sp,
                      color: content1_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                // content1_CL
              ]),
        ),
      ),
    );
  }
}
