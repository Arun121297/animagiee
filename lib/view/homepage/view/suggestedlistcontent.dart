import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../controller/suggestedfriendController.dart';

class Suggested_List_Content extends StatefulWidget {
  var fetchindex;
  // var data;
  Suggested_List_Content({
    Key? key,
    this.fetchindex,
  }) : super(key: key);

  @override
  State<Suggested_List_Content> createState() => _Suggested_List_ContentState();
}

class _Suggested_List_ContentState extends State<Suggested_List_Content> {
  SugestedFrindListController sugestedFrindListController =
      Get.put(SugestedFrindListController());
  FollowRequestContoller followRequestContoller =
      Get.put(FollowRequestContoller());
  bool visible = false;
  // var sugimage = "images/Reptiles_and_Amphibians.jpg";
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   followRequestContoller.followRequestPost(id: widget.fetchindex);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var data = sugestedFrindListController.Suggesteddata[0].data;
    var uname =
        data![widget.fetchindex].username!.replaceAll(RegExp('@gmail.com'), '');
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0.sp),
          // borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(40.0.sp),
          //     bottomRight: Radius.circular(40.0.sp),
          //     topLeft: Radius.circular(5.0.sp),
          //     topRight: Radius.circular(5.0.sp)),
          border: Border.all(color: Colors.grey, width: 2)),
      height: 13.0.hp,
      // 135,
      width: 32.0.wp,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 1.0.hp,
            //  10,
          ),
          data[widget.fetchindex].profileicon == ''
              ? CircleAvatar(
                  radius: 40.0.sp,
                  backgroundColor: animagiee_CL,
                  // backgroundImage:
                  //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                  //  50,
                )
              : CircleAvatar(
                  radius: 40.0.sp,
                  backgroundImage:
                      NetworkImage("${data[widget.fetchindex].profileicon}"),
                  //  50,
                ),
          Text(
            uname.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 7.0.sp,
                color: animagiee_CL,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                setState(() {
                  if (sugestedFrindListController
                          .requestType[widget.fetchindex] ==
                      "follow") {
                    sugestedFrindListController.requestType[widget.fetchindex] =
                        "requested";
                    followRequestContoller.followRequestPost(
                        id: data[widget.fetchindex].id.toString());
                  } else {
                    // TODO:if you need to changes the toast message
                    Fluttertoast.showToast(msg: "Already request send");
                  }

                  // sugestedFrindListController.followUnfollow(
                  //     index: widget.fetchindex,
                  //     userId: data[widget.fetchindex].id,
                  //     privacy: visible);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5.0.sp),
                  border: Border.all(color: animagiee_CL, width: 2),
                  color: animagiee_CL,
                ),
                height: 4.0.hp,
                // 30,
                width: 32.0.wp,
                // 117,
                alignment: Alignment.center,
                child: Text(
                  sugestedFrindListController.requestType[widget.fetchindex]
                      .toString()
                      .toUpperCase(),
                  // data[widget.fetchindex]
                  //     .requestStatus
                  //     .toString()
                  //     .toUpperCase()
                  //     .replaceAll(RegExp('RequestStatus.'), ''),
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 8.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
