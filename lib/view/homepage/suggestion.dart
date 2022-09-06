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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: MediaQuery.of(context).size.width,
      color: suggested_background_CL,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
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
            height: 200,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 2)),
                  height: 135,
                  width: 117,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 50,
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: animagiee_CL, width: 2),
                          color: animagiee_CL,
                        ),
                        height: 30,
                        width: 117,
                        alignment: Alignment.center,
                        child: Text(
                          "Join",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.0.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
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
