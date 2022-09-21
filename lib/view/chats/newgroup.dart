import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/searchbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

import '../homeAppBar/appbar.dart';
import 'chatscreen1.dart';

import 'groupchatscreen.dart';
import 'newgrouplistcontent.dart';

class Create_New_Group_UI extends StatefulWidget {
  const Create_New_Group_UI({Key? key}) : super(key: key);

  @override
  State<Create_New_Group_UI> createState() => _Create_New_Group_UIState();
}

class _Create_New_Group_UIState extends State<Create_New_Group_UI> {
  Controller controller = Get.put(Controller());
  List<bool> valuebol = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarContainer(
                title: "New Group",
                logo: false,
                notification: false,
                search: false,
                edit: false,
                backarrow: true,
                firstscreen: false,
                navipage: null,
                chat: false,
                podcast: false,
                fun: Chat_UI(),
              ),
              // controller.chatapp("New Group", Chat_UI(), context),
              SizedBox(
                height: 3.0.hp,
                //  26,
              ),
              Align(alignment: Alignment.center, child: chat_Search_UI()),
              SizedBox(
                height: 4.0.hp,
                // 32,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        // backgroundImage: ExactAssetImage("images/Vector.png"),
                      ),
                      Positioned(
                        bottom: 2.0.sp,
                        child: SizedBox(
                          height: 13,
                          width: 13,
                          child: Image.asset("images/groupadd.png"),
                        ),
                      )
                    ])),
                    SizedBox(
                      width: 3.0.wp,
                      //  17,
                    ),
                    Container(
                      width: 75.0.wp,
                      // 260,
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Group Name",
                            // labelText: 'Group name',
                            hintStyle: TextStyle(
                                color: content1_CL,
                                fontSize: 9.0.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Text(
                  "Suggested",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12.0.sp,
                      color: animagiee_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 50.0.hp,
                //  360,
                ////create group and add
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return NewGroup_List_Content();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: controller.communityNext(
                    "Add to Group", Group_Chat_Screen_UI()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
