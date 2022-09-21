import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Suggested_List_Content extends StatefulWidget {
  var fetchindex;
  Suggested_List_Content({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Suggested_List_Content> createState() => _Suggested_List_ContentState();
}

class _Suggested_List_ContentState extends State<Suggested_List_Content> {
  bool visible = false;
  var sugimage = "images/Reptiles_and_Amphibians.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0.sp),
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(40.0.sp),
          //     bottomRight: Radius.circular(40.0.sp),
          //     topLeft: Radius.circular(5.0.sp),
          //     topRight: Radius.circular(5.0.sp)),
          border: Border.all(color: Colors.grey, width: 2)),
      height: 13.0.hp,
      // 135,
      width: 32.0.wp,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 1.0.hp,
            //  10,
          ),
          CircleAvatar(
            radius: 40.0.sp, backgroundImage: ExactAssetImage(sugimage),
            //  50,
          ),
          Text(
            "Suggested: ${widget.fetchindex}",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 7.0.sp,
                color: animagiee_CL,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (visible == true) {
                  visible = false;
                } else {
                  visible = true;
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5.0.sp),
                border: Border.all(color: animagiee_CL, width: 2),
                color: animagiee_CL,
              ),
              height: 4.0.hp,
              // 30,
              width: 32.0.wp,
              // 117,
              alignment: Alignment.center,
              child: Text(
                visible == true ? "Join" : "Request",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 8.0.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
