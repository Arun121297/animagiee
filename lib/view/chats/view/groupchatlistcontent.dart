import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';

class GroupChat_List_Content extends StatefulWidget {
  var fetchindex;
  GroupChat_List_Content({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<GroupChat_List_Content> createState() => _GroupChat_List_ContentState();
}

class _GroupChat_List_ContentState extends State<GroupChat_List_Content> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // color: Colors.green,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                height: 7.5.hp,
                // 60,
                width: 56.0.wp,
                //  199,
                // color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              ExactAssetImage("images/myprofilebg.jpg"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          // height: 31,
                          // width: 159,
                          height: 4.0.hp,
                          //  31,
                          width: 43.0.wp,
                          // 159,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0.sp))),
                        )
                      ],
                    ),
                    Text(
                      "9.20am",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 7.0.sp,
                          color: content1_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                height: 6.5.hp,
                // 60,
                width: 45.0.wp,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 4.0.hp,
                          //  31,
                          width: 43.0.wp,
                          // 159,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0.sp))),
                        )
                      ],
                    ),
                    Text(
                      "9.20am",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 7.0.sp,
                          color: content1_CL,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.fetchindex == 3 ? true : false,
            child: Row(children: [
              Expanded(child: Divider()),
              Text(
                "Today",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: sendBox_CL,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(child: Divider()),
            ]),
          )
        ],
      ),
    );
  }
}
