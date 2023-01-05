import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/instancepage/controller/myFollowerController.dart';
import 'package:animagieeui/view/instancepage/controller/removeFollowersController.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFollower extends StatefulWidget {
  const MyFollower({super.key});

  @override
  State<MyFollower> createState() => _MyFollowerState();
}

class _MyFollowerState extends State<MyFollower> {
  MyFollowerController myFollowerController = Get.put(MyFollowerController());
  FollowRequestContoller followRequestContoller =
      Get.put(FollowRequestContoller());
  RemoveFollowersContoller removeFollowersContoller =
      Get.put(RemoveFollowersContoller());

  @override
  void initState() {
    myFollowerController.myFollower();
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
        title: Text("Followers",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        if (myFollowerController.isLoadingService.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (myFollowerController
            .myFollowerData[0].data![0].followerUser!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: myFollowerController
                  .myFollowerData[0].data![0].followerUser!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = myFollowerController
                    .myFollowerData[0].data![0].followerUser![index];
                return Stack(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: mywork_container_CL))),
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        Get.to(User_Profile(
                          id: data.userid!.id.toString(),
                          postId: '',
                        ));
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
                        removeFollowersContoller.removeFollowers(
                            id: data.userid!.id.toString());
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
