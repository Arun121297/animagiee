import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/instancepage/controller/myFollowingUserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFollowUser extends StatefulWidget {
  const MyFollowUser({super.key});

  @override
  State<MyFollowUser> createState() => _MyFollowUserState();
}

class _MyFollowUserState extends State<MyFollowUser> {
  MyFollowingUserController myFollowingUserController =
      Get.put(MyFollowingUserController());
  FollowRequestContoller followRequestContoller =
      Get.put(FollowRequestContoller());

  @override
  void initState() {
    myFollowingUserController.myFollowerUser();
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
        if (myFollowingUserController.isLoadingService.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (myFollowingUserController
            .myFollowuserData[0].data![0].followingUser!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return SizedBox(
              height: SizeConfig.screenHeight,
              child: ListView.builder(
                  itemCount: myFollowingUserController
                      .myFollowuserData[0].data![0].followingUser!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = myFollowingUserController
                        .myFollowuserData[0].data![0].followingUser![index];
                    return GestureDetector(
                      onTap: () {
                        // Get.to(User_Profile(
                        //   id: data.id!,
                        // ));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.022,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              backgroundImage: NetworkImage(data
                                                  .userid!.profileicon
                                                  .toString()),
                                              // backgroundColor: animagiee_CL,
                                              radius: 40.0.sp,
                                            ),
                                          ),
                                    Text(
                                      data.userid!.username.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: availabletime_CL,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        followRequestContoller
                                            .followRequestPost(
                                                id: data.userid!.id.toString());
                                        Get.back();
                                        // deleteFollowRequestController
                                        //     .deleteFollowRequestPost(
                                        //         id: data.id.toString());
                                      },
                                      child: Container(
                                        height: 3.0.hp,
                                        // 26,
                                        width: 20.0.wp,
                                        // 90,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: animagiee_CL,
                                            borderRadius:
                                                BorderRadius.circular(15.0.sp)),
                                        child: Text(
                                          "UnFollow",
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
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: 0.3,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  }));
        }
      }),
    );
  }
}
