import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class NewGroup_List_Content extends StatefulWidget {
  NewGroup_List_Content({Key? key}) : super(key: key);

  @override
  State<NewGroup_List_Content> createState() => _NewGroup_List_ContentState();
}

class _NewGroup_List_ContentState extends State<NewGroup_List_Content> {
  bool valuebol = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
      child: SizedBox(
        height: 8.0.hp,
        // 56,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("images/myprofilebg.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daniel Smith",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    "Pet lover",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: content1_CL,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              child: Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return animagiee_CL.withOpacity(.32);
                  }
                  return animagiee_CL;
                }),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0.sp)),
                value: valuebol,
                onChanged: (value) {
                  setState(() {
                    valuebol = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
