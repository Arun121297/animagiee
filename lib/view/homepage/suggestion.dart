import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/suggestedlistcontent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Suggested_For_You_UI extends StatelessWidget {
  Suggested_For_You_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0.hp,
      // height: 260,
      width: MediaQuery.of(context).size.width,
      color: suggested_background_CL,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Row(
              children: [
                Text(
                  "Suggested for You",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 8.0.sp,
                      color: buttonColor1_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.0.sp,
                              color: TextContent2_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 25.0.hp,
            // 200,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 2.0.wp,
                  //  10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0.sp),
              itemBuilder: (context, index) {
                return Suggested_List_Content(fetchindex: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
