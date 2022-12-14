import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/chat.dart';
import 'package:flutter/material.dart';

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
                  borderRadius: BorderRadius.circular(10.0.sp),
                ),
                child: Container(
                  height: 10.0.hp,
                  //  65,
                  // width: 300,
                  child: ListTile(
                      onTap: () => Get.to(Chatting_Screen_UI()),
                      isThreeLine: false,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: index > 0 && index < 4 ? true : false,
                            child: CircleAvatar(
                              radius: 5.0.sp,
                              backgroundColor: animagiee_CL,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 3.5.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.0.wp,
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23.0.hp,
              width: 70.0.wp,
              child: Image.asset(
                sampleimage,
                fit: BoxFit.cover,
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
                  Expanded(child: SizedBox()),
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
                  SizedBox(
                    height: 5,
                    child: Divider(
                      indent: 50,
                      endIndent: 30,
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    child: Divider(
                      indent: 30,
                      endIndent: 40,
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
