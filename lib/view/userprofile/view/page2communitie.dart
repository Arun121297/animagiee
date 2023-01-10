import 'dart:developer';

import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/instancepage/controller/communiti_userList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page2communitielist.dart';

// class UserPage_Communitie_Page2 extends StatefulWidget {
//   const UserPage_Communitie_Page2({Key? key}) : super(key: key);

//   @override
//   State<UserPage_Communitie_Page2> createState() =>
//       _UserPage_Communitie_Page2State();
// }

// class _UserPage_Communitie_Page2State extends State<UserPage_Communitie_Page2> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class UserPage_Communitie_Page2 extends StatefulWidget {
  String id;
  UserPage_Communitie_Page2({required this.id});

  @override
  State<UserPage_Communitie_Page2> createState() =>
      _UserPage_Communitie_Page2State();
}

class _UserPage_Communitie_Page2State extends State<UserPage_Communitie_Page2> {
  CommunitiPostListController communitiPostListController =
      Get.put(CommunitiPostListController());
  MyClubController clubController = Get.put(MyClubController());
  String myUserId = "";
  @override
  void initState() {
    fetchData();
    fetchProfile();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await communitiPostListController.communitiListPost(widget.id);
    });
  }

  clubJoinRequest({required id, required index}) async {
    await clubController.clubJoinRequest(clubId: id);
    var data = communitiPostListController.data[index];
    if (data.joinedStatus.toString() == "Join") {
      data.joinedStatus = "Pending";
    } else {}
    setState(() {});
  }

  leaveFromClub({required id, required index}) {
    clubController.leaveFromCLub(clubId: id, index: index);
  }

  fetchProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    myUserId = pref.getString(Constant.userId)!;
    log("ccccccc$myUserId");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (communitiPostListController.userprofilescreenloadingindicator.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (communitiPostListController.data.isEmpty) {
        return const Center(
          child: Text("No Communities found"),
        );
      } else {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: communitiPostListController.data.length,
            itemBuilder: (context, index) {
              var listData = communitiPostListController.data[index];
              return Page2_Communitie_List(
                name: listData.clubName ?? "",
                icon: listData.clubicon ?? "",
                id: listData.clubid ?? "",
                userId: widget.id,
                status: listData.joinedStatus ?? "",
                clubOwner: listData.clubOwner,
                myUserId: myUserId,
                onTap: () {
                  if (listData.joinedStatus == "Joined") {
                    leaveFromClub(id: listData.clubid, index: index);
                  } else {
                    clubJoinRequest(id: listData.clubid, index: index);
                  }
                },
              );
            });
      }
    });
  }
}
