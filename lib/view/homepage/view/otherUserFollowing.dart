import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/instancepage/controller/otherUserFollowingController.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherUserFollowingView extends StatefulWidget {
  String id;

  OtherUserFollowingView({required this.id});

  @override
  State<OtherUserFollowingView> createState() => _OtherUserFollowingViewState();
}

class _OtherUserFollowingViewState extends State<OtherUserFollowingView> {
  OtherUserFollowingContoller otherUserFollowingContoller =
      Get.put(OtherUserFollowingContoller());
  @override
  void initState() {
    otherUserFollowingContoller.otherUserFollowing(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: mywork_container_CL,
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp),
            color: Colors.black,
            onPressed: () {
              Get.back();
            }),
        title: Text("Following",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        if (otherUserFollowingContoller.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (otherUserFollowingContoller
            .otherFollowingUserData[0].data![0].followingUser!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: otherUserFollowingContoller
                  .otherFollowingUserData[0].data![0].followingUser!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = otherUserFollowingContoller
                    .otherFollowingUserData[0].data![0].followingUser![index];
                return Stack(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: mywork_container_CL))),
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        Get.to(User_Profile(id: data.userid!.id.toString()));
                      },
                      child: Row(
                        children: [
                          data.userid!.profileicon == ''
                              ? CircleAvatar(
                                  radius: 20.0.sp,
                                  backgroundColor: animagiee_CL,
                                  // backgroundImage:
                                  //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                                  //  50,
                                )
                              : CircleAvatar(
                                  radius: 20.0.sp,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        data.userid!.profileicon.toString()),
                                    // backgroundColor: animagiee_CL,
                                    radius: 40.0.sp,
                                  ),
                                ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0.wp),
                            child: Text(
                              data.userid!.username
                                  .toString()
                                  .replaceAll(RegExp('@gmail.com'), ''),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: availabletime_CL,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 78.0.wp, top: 5.0.wp),
                    child: GestureDetector(
                      onTap: () {
                        // followRequestContoller
                        //     .followRequestPost(
                        //         id: data.userid!.id
                        //             .toString());
                        // deleteFollowRequestController
                        //     .deleteFollowRequestPost(
                        //         id: data.id.toString());
                        Get.back();
                      },
                      child: Container(
                        height: 3.0.hp,
                        // 26,
                        width: 20.0.wp,
                        // 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: animagiee_CL,
                            borderRadius: BorderRadius.circular(15.0.sp)),
                        child: Text(
                          "Remove",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
              });
        }
      }),
    );
  }
}
