import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
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
    return
        // Scaffold(
        //   body:
        SizedBox(
      // color: Colors.amberAccent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Get.to(const Create_New_Group_UI());
          },
          child: Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Container(
              height: 8.0.hp,
              // 56,
              width: 90.0.wp,
              // 336,
              // color: Colors.white,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: content1_CL))),
              child: Row(children: [
                const Icon(
                  Icons.person_add,
                  color: content1_CL,
                ),
                SizedBox(
                  width: 3.0.wp,
                  // 10,
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
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: content1_CL,
                )
              ]),
            ),
          ),
        ),
        SizedBox(
          width: 95.0.wp,
          // 336,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(const Group_Chat_Screen_UI());
                  // print(index);
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.sp),
                  ),
                  child: SizedBox(
                    height: 9.0.hp,
                    // 65,
                    // width: 300,
                    child: ListTile(
                        isThreeLine: false,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: index >= 0 && index < 3 ? true : false,
                              child: CircleAvatar(
                                radius: 5.0.sp,
                                backgroundColor: animagiee_CL,
                                child: const Text(
                                  "123",
                                  style: TextStyle(
                                      fontSize: 5, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "1 min ago",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 5.0.sp,
                                  color: content1_CL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
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
                        subtitle: SizedBox(
                          width: 80.0.wp,
                          //  223,
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
                          backgroundImage:
                              const ExactAssetImage("images/myprofilebg.jpg"),
                          radius: 19.0.sp,
                        )),
                  ),
                ),
              );
            },
          ),
        )
      ]),
      // ),
    );
  }
}
