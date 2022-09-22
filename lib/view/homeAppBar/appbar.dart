import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homeAppBar/prot.dart';
import 'package:animagieeui/view/homeAppBar/search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../profilepage/editprofilepage.dart';
import 'chat.dart';
import 'notification.dart';

class AppbarContainer extends StatefulWidget {
  var title;
  bool logo;
  bool backarrow;
  var fun;
  bool chat;
  bool podcast;
  bool search;
  bool notification;
  bool edit;
  bool firstscreen;
  var navipage;

  AppbarContainer(
      {Key? key,
      this.title,
      required this.logo,
      required this.notification,
      required this.search,
      required this.backarrow,
      required this.podcast,
      this.fun,
      required this.edit,
      this.navipage,
      required this.firstscreen,
      required this.chat})
      : super(key: key);

  @override
  State<AppbarContainer> createState() => _AppbarContainerState();
}

class _AppbarContainerState extends State<AppbarContainer> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: SizedBox(
        height: 7.0.hp,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  ///logo
                  Visibility(
                    visible: widget.logo,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.0.sp),
                      width: 30.0.wp,
                      // 122,
                      height: 28.0.hp,
                      child: Image.asset("images/ani.png"),
                    ),
                  ),
                  //balance screen back arrow
                  Visibility(
                    visible: widget.backarrow,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 12.0.sp,
                      ),
                      onPressed: () {
                        Get.to(widget.fun);
                      },
                    ),
                  ),
                  //firstscreen backarrow
                  Visibility(
                    visible: widget.firstscreen,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 12.0.sp,
                      ),
                      onPressed: () {
                        controller.selectedIndex.value = widget.navipage;
                        // Get.to(widget.fun);
                      },
                    ),
                  ),
                ],
              ),
            ),

            ///logo hide spacer
            Visibility(
              visible: widget.logo == false ? true : false,
              child: SizedBox(
                width: 7.0.wp,
              ),
            ),

            ///(logo backarrow chat podcast notification edit) => false => spacer
            Visibility(
              visible: widget.logo == false &&
                      widget.backarrow == false &&
                      widget.chat == false &&
                      widget.podcast == false &&
                      widget.notification == false &&
                      widget.edit == false
                  ? true
                  : false,
              child: SizedBox(
                width: 11.0.wp,
              ),
            ),
            Expanded(
              // flex: 1,
              child: Container(
                alignment: Alignment.center,
                height: 7.0.hp,
                child: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            // logo: false,
            //         notification: true,
            //         search: false,
            //         backarrow: true,
            //         podcast: false,
            //         chat: false,
            //         edit: false,
            //         firstscreen: false,
            //         navipage: null,
            ///only notification
            Visibility(
              visible: widget.search == false &&
                      widget.chat == false &&
                      widget.podcast == false &&
                      widget.notification == true &&
                      widget.edit == false &&
                      widget.firstscreen == false &&
                      widget.backarrow == true &&
                      widget.logo == false
                  ? true
                  : false,
              child: SizedBox(
                width: 13.0.wp,
              ),
            ),
            Visibility(
              visible: widget.search == false &&
                      widget.chat == false &&
                      widget.podcast == false &&
                      widget.notification == false &&
                      widget.edit == false
                  ? true
                  : false,
              child: SizedBox(
                width: 18.0.wp,
              ),
            ),
            Container(
              height: 7.0.hp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(visible: widget.search, child: Search_UI()),
                  Visibility(visible: widget.chat, child: Chat_Icon_UI()),
                  Visibility(visible: widget.podcast, child: PodCast_UI()),
                  Visibility(
                      visible: widget.notification, child: Notification_UI()),
                  // SizedBox(
                  //   width: 4.0.wp,
                  // )
                ],
              ),
            ),

            Visibility(
              visible: widget.edit,
              child: GestureDetector(
                onTap: () {
                  Get.to(Edit_Profile_UI());
                },
                child: Container(
                  height: 3.3.hp,
                  //  20,
                  width: 20.0.wp,
                  // 70,
                  decoration: BoxDecoration(
                      color: animagiee_CL,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Edit",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 9.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0.hp,
                        width: 3.0.wp,
                        child: Image.asset(
                          "images/editicon.png",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2.0.wp,
            )
          ],
        ),
      ),
    );
  }
}
