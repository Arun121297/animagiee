import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import 'groupchatscreen.dart';
import 'newgroup.dart';

class Group_Chat_UI extends StatefulWidget {
  const Group_Chat_UI({Key? key}) : super(key: key);

  @override
  State<Group_Chat_UI> createState() => _Group_Chat_UIState();
}

class _Group_Chat_UIState extends State<Group_Chat_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Get.to(Create_New_Group_UI());
          },
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 56,
              width: 336,
              // color: Colors.white,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: content1_CL))),
              child: Row(children: [
                Icon(
                  Icons.person_add,
                  color: content1_CL,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Create New Group",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: content1_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_right,
                  color: content1_CL,
                )
              ]),
            ),
          ),
        ),
        SizedBox(
          width: 336,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(Group_Chat_Screen_UI());
                  print(index);
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.orange,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),

                    height: 65,
                    // width: 300,
                    child: ListTile(
                        isThreeLine: false,
                        trailing: Text(
                          "1 min ago",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 5.0.sp,
                              color: content1_CL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        title: Text(
                          "Name",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        subtitle: Container(
                          width: 223,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and ...",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 6.0.sp,
                                color: content1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 19.0.sp,
                        )),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
