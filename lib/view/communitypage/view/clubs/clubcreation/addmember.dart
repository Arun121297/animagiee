import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/chats/view/searchbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/colorconfig.dart';
import '../../../../chats/view/chatscreen1.dart';
import '../../../../chats/view/groupchatscreen.dart';
import '../../../../chats/view/newgrouplistcontent.dart';
import '../../../../homeAppBar/view/appbar.dart';
import 'memberslistforcommunities.dart';
import 'mycreatedclub.dart';

class MyClubAddMember extends StatefulWidget {
  const MyClubAddMember({Key? key}) : super(key: key);

  @override
  State<MyClubAddMember> createState() => _MyClubAddMemberState();
}

class _MyClubAddMemberState extends State<MyClubAddMember> {
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
                searchfunction: true,
                searchfunctionclose: false,
                title: "Add Member",
                logo: false,
                notification_back_arrow: false,
                notification: false,
                search: false,
                edit: false,
                backarrow: true,
                firstscreen: false,
                navipage: null,
                chat: false,
                podcast: false,
                fun: MyClubCreation(),
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

              SizedBox(
                height: 50.0.hp,
                //  360,
                ////create group and add
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return MembersForCommunities();
                    // NewGroup_List_Content();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Get.to(MyClubCreation());
                    // Get.to(fun);
                  },
                  child: Container(
                    height: 6.0.hp,
                    width: 30.0.wp,
                    decoration: BoxDecoration(
                        color: animagiee_CL,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Text(
                      'Save',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.0.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                // child: controller.communityNext(
                //     "Add to Group", Group_Chat_Screen_UI()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
