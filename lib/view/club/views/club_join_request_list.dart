import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClubJoinRequestList extends StatefulWidget {
  ClubJoinRequestList({super.key, required this.clubId});
  String? clubId;

  @override
  State<ClubJoinRequestList> createState() => _ClubJoinRequestListState();
}

class _ClubJoinRequestListState extends State<ClubJoinRequestList> {
  // FollowRequestGetController followrRequestGetController =
  //     Get.put(FollowRequestGetController());
  // ConfirmFollowRequestController confirmFollowRequestController =
  //     Get.put(ConfirmFollowRequestController());
  // DeleteFollowRequestController deleteFollowRequestController =
  //     Get.put(DeleteFollowRequestController());

  MyClubController clubController = Get.put(MyClubController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      clubController.getClubRequestList(clubId: widget.clubId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: mywork_container_CL,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp),
            color: Colors.black,
            onPressed: () {
              Get.back();
            }),
        title: Text("Request users",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        if (clubController.isClubRequestListLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (clubController.clubRequestList.isEmpty ||
            clubController.clubRequestList.first.data!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          var data = clubController.clubRequestList.first.data;
          return SizedBox(
            height: SizeConfig.screenHeight,
            child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var listData = data[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => User_Profile(
                            id: listData.sendByuser!.id ?? "",
                          ));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.022,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    listData.sendByuser!.profileicon!.isEmpty
                                        ? CircleAvatar(
                                            radius: 20.0.sp,
                                            backgroundColor: Colors.white,
                                            backgroundImage: const AssetImage(
                                                "images/profile_icon.png"),
                                          )
                                        : CircleAvatar(
                                            radius: 20.0.sp,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  listData
                                                      .sendByuser!.profileicon
                                                      .toString()),
                                              // backgroundColor: animagiee_CL,
                                              radius: 40.0.sp,
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 37.0.wp,
                                            child: Text(
                                              listData.sendByuser!.username
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: availabletime_CL,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              clubController
                                                  .clubRequestAccept(
                                                      requestId: listData.id,
                                                      index: index)
                                                  .then((value) =>
                                                      clubController
                                                          .clubRequestList
                                                          .refresh());
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
                                                      BorderRadius.circular(
                                                          15.0.sp)),
                                              child: Text(
                                                "Accept",
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
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 4.0.sp),
                                            child: GestureDetector(
                                              onTap: () async {
                                                await clubController
                                                    .clubRequestReject(
                                                        requestId: listData.id,
                                                        index: index)
                                                    .then((value) =>
                                                        clubController
                                                            .clubRequestList
                                                            .refresh());
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
                                                        BorderRadius.circular(
                                                            15.0.sp)),
                                                child: Text(
                                                  "Reject",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      fontSize: 9.0.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.010,
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
                }),
          );
        }
      }),
    );
  }
}
