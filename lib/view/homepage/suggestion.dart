import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Suggested_For_You_UI extends StatefulWidget {
  const Suggested_For_You_UI({Key? key}) : super(key: key);

  @override
  State<Suggested_For_You_UI> createState() => _Suggested_For_You_UIState();
}

class _Suggested_For_You_UIState extends State<Suggested_For_You_UI> {
  var i = 0;
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
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                      CircleAvatar(radius: 40.0.sp
                          //  50,
                          ),
                      Text(
                        "Suggested: $index",
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
                            if (i == 1) {
                              i = 0;
                            } else if (i == 0) {
                              i = 1;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: animagiee_CL, width: 2),
                            color: animagiee_CL,
                          ),
                          height: 4.0.hp,
                          // 30,
                          width: 32.0.wp,
                          // 117,
                          alignment: Alignment.center,
                          child: Text(
                            i == 1 ? "Join" : "Request",
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
