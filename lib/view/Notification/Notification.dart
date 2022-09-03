import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notificationappbar.dart';

class Notification_Content_Design_UI extends StatefulWidget {
  const Notification_Content_Design_UI({Key? key}) : super(key: key);

  @override
  State<Notification_Content_Design_UI> createState() =>
      _Notification_Content_Design_UIState();
}

class _Notification_Content_Design_UIState
    extends State<Notification_Content_Design_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Notification_AppBar_UI(
              title: "Notification",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recommend notification",
                // textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11.5.sp,
                    color: animagiee_CL,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        "Recommended for you",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {
                          setState(() {
                            popup();
                          });
                        },
                      ),
                      subtitle: Text(
                        "Lorem Ipsum is simply dummy text of the printing and ...",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 7.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      color: Colors.grey,
                      thickness: 1,
                    )
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Documents approval status"),
                    Text(
                      "Your Documents have been approved successfull and has\nbeen verified.You can activate your Doctor module by clicking\non the activate button given below..",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 6.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.profilechangebool(true);
                        controller.appoinmentdetailshide(false);
                      },
                      child: Container(
                        height: 5.0.hp,
                        // 31,
                        width: 30.0.wp,
                        //  100,
                        alignment: Alignment.center,
                        child: Text(
                          "Activate",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.5.sp,
                              color: animagiee_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: notificationContent1_CL),
                      ),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
            Divider(
              endIndent: 20,
              indent: 20,
              color: Colors.grey,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nina ann"),
                    Text(
                      "Nina ann Requested to follow you",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 6.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 4.0.hp,
                            // 31,
                            width: 27.0.wp,
                            //  100,
                            alignment: Alignment.center,
                            child: Text(
                              "Accept",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: animagiee_CL),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 4.0.hp,
                            // 31,
                            width: 27.0.wp,
                            //  100,
                            alignment: Alignment.center,
                            child: Text(
                              "Deny",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: animagiee_CL),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
              ],
            ),
          ],
        ),
      )),
    );
  }

  popup() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Card(
                child: Container(
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 10,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Text("Mute Notifcations"),
                ],
              ),
            ))
          ],
        );
      },
    );
  }
}
