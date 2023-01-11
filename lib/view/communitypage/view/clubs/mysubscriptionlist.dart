import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/utils/helper/popup_helper.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
// import 'package:animagieeui/view/communitypage/controller/mysubscriptioncontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';
import '../../../animagieeprofile/view/animalsprofiles.dart';

class My_Sub_List_Content extends StatefulWidget {
  var fetchindex;
  String? myUserId;
  My_Sub_List_Content({Key? key, this.fetchindex, required this.myUserId})
      : super(key: key);

  @override
  State<My_Sub_List_Content> createState() => _My_Sub_List_ContentState();
}

class _My_Sub_List_ContentState extends State<My_Sub_List_Content> {
  Controller controller = Get.put(Controller());
  MyClubController clubController = Get.find();
  // MySubscriptionController mySubscriptionController =
  //     Get.put(MySubscriptionController());
  bool visibility = false;
  leaveFromClub({required id, required index}) async {
    clubController.leaveFromCLub(clubId: id).then((value) {
      if (value) {
        clubController.joinedClubList.first.data!.removeAt(index);
        clubController.joinedClubList.refresh();
        Get.back();
      }
    });
  }

  deleteClub({required id, required index}) async {
    clubController.deleteClub(clubId: id).then((value) {
      if (value) {
        clubController.joinedClubList.first.data!.removeAt(index);
        clubController.joinedClubList.refresh();
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = clubController.joinedClubList.first.data![widget.fetchindex];
    return InkWell(
      onTap: () {
        Get.to(() => Animals_Profiles_UI(
              id: data.clubid ?? "",
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data.clubicon ?? ""),
            ),
            title: Text(data.clubName ?? ""),
            trailing: GestureDetector(
              onTap: () {
                if (data.clubOwner.toString() == widget.myUserId.toString()) {
                  // deleteClub(id: data.clubid, index: widget.fetchindex);
                  helperPopup(
                      context: context,
                      title: "Are you sure do you want delete? ",
                      noOnTap: () {
                        Get.back();
                      },
                      yesOnTap: () =>
                          deleteClub(id: data.clubid, index: widget.fetchindex),
                      yesButtonTitle: "Leave");
                } else {
                  helperPopup(
                      context: context,
                      title: "Are you sure do you want leave? ",
                      noOnTap: () {
                        Get.back();
                      },
                      yesOnTap: () => leaveFromClub(
                          id: data.clubid, index: widget.fetchindex),
                      yesButtonTitle: "Leave");
                }
              },
              child: Container(
                height: 3.5.hp,
                //  26,
                width: 24.0.wp,
                // 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: animagiee_CL,
                    borderRadius: BorderRadius.circular(5.0.sp)),
                child: Text(
                  data.clubOwner.toString() == widget.myUserId.toString()
                      ? "Delete"
                      : "Leave",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
