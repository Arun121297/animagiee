import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/instancepage/controller/confirmFollowRequest.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestGetController.dart';
import 'package:animagieeui/view/instancepage/controller/ignoreFollowRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowRequestGet extends StatefulWidget {
  const FollowRequestGet({super.key});

  @override
  State<FollowRequestGet> createState() => _FollowRequestGetState();
}

class _FollowRequestGetState extends State<FollowRequestGet> {
  FollowRequestGetController followrRequestGetController =
      Get.put(FollowRequestGetController());
  ConfirmFollowRequestController confirmFollowRequestController =
      Get.put(ConfirmFollowRequestController());
  DeleteFollowRequestController deleteFollowRequestController =
      Get.put(DeleteFollowRequestController());

  @override
  void initState() {
    followrRequestGetController.followRequestGetPost();
    super.initState();
  }

  void sendConfirmationRequest(reqId, index) {
    confirmFollowRequestController.confirmFollowRequestPost(id: reqId);
    followrRequestGetController.data[0].data!.removeAt(index);
    setState(() {});
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
        if (followrRequestGetController
                .followrequestgetloadingindicator.value ==
            true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (followrRequestGetController.data.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return SizedBox(
            height: SizeConfig.screenHeight,
            child: ListView.builder(
                itemCount: followrRequestGetController.data[0].data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = followrRequestGetController.data[0].data![index];
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
                                    data.sendBy!.profileicon == ''
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
                                                  .sendBy!.profileicon
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
                                              data.sendBy!.username.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: availabletime_CL,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              confirmFollowRequestController
                                                  .confirmFollowRequestPost(
                                                      id: data.id.toString());
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
                                              onTap: () {
                                                deleteFollowRequestController
                                                    .deleteFollowRequestPost(
                                                        id: data.id.toString());
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
                                                  "Deny",
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
