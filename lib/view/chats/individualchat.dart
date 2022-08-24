import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Separate_Chat_UI extends StatefulWidget {
  const Separate_Chat_UI({Key? key}) : super(key: key);

  @override
  State<Separate_Chat_UI> createState() => _Separate_Chat_UIState();
}

class _Separate_Chat_UIState extends State<Separate_Chat_UI> {
  String sampleimage = "images/horse.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        // GestureDetector(
        //   onTap: () {
        //     // Get.to(Create_New_Group_UI());
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(30.0),
        //     child: Container(
        //       height: 56,
        //       width: 336,
        //       // color: Colors.white,
        //       decoration: BoxDecoration(
        //           border: Border(bottom: BorderSide(color: Colors.grey))),
        //       child: Row(children: [
        //         Icon(Icons.person_add),
        //         Text("Create New Group"),
        //         Expanded(child: Container()),
        //         Icon(Icons.arrow_right)
        //       ]),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 95.0.wp,
          // 336,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 5,
              );
            },
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.orange,
                  //   borderRadius: BorderRadius.circular(20),
                  // ),

                  height: 10.0.hp,
                  //  65,
                  // width: 300,
                  child: ListTile(
                      onTap: () => Get.to(Chatting_Screen_UI()),
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
                      subtitle: Text(
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
                      leading: GestureDetector(
                        onTap: () {
                          setState(() {
                            AlertDialog();
                          });
                        },
                        child: CircleAvatar(
                          backgroundImage: ExactAssetImage(sampleimage),
                          radius: 20,
                        ),
                      )),
                ),
              );
            },
          ),
        )
      ]),
    );
  }

  AlertDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23.0.hp, width: 70.0.wp,
              // alignment: Alignment.center,
              child: Image.asset(
                sampleimage, fit: BoxFit.cover,
                // cacheHeight: 197,
                // cacheWidth: 246,
              ),
            ),
            Container(
              color: animagiee_CL,
              height: 9.0.hp,
              // 60,
              width: 70.0.wp,
              //  246,
              child: Column(
                children: [
                  Text(
                    "Karthi",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 14.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(
                    indent: 30,
                    endIndent: 40,
                    color: Colors.white,
                    thickness: 2,
                  ),
                  Divider(
                    indent: 50,
                    endIndent: 30,
                    color: Colors.white,
                    thickness: 2,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
