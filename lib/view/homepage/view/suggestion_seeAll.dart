import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/controller/suggestedfriendController.dart';
import 'package:animagieeui/view/instancepage/controller/followRequestController.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionSeeAll extends StatefulWidget {
  const SuggestionSeeAll({super.key});

  @override
  State<SuggestionSeeAll> createState() => _SuggestionSeeAllState();
}

class _SuggestionSeeAllState extends State<SuggestionSeeAll> {
  SugestedFrindListController sugestedFrindListController =
      Get.put(SugestedFrindListController());
  FollowRequestContoller followRequestContoller =
      Get.put(FollowRequestContoller());
  @override
  void initState() {
    // TODO: implement initState
    sugestedFrindListController.suggestedcontrollerfunction();
    super.initState();
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
        title: Text("Suggestion All List",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        if (sugestedFrindListController.isLoadingService.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (sugestedFrindListController.Suggesteddata.isEmpty ||
            sugestedFrindListController.Suggesteddata.first.data!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return ListView.builder(
            itemCount:
                sugestedFrindListController.Suggesteddata.first.data!.length,
            itemBuilder: (BuildContext context, int index) {
              var data =
                  sugestedFrindListController.Suggesteddata.first.data![index];
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0.sp),
                      border: Border.all(color: Colors.grey, width: 1)),
                  height: 7.0.hp,
                  // 135,
                  width: 3.0.wp,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.0.sp,
                        height: 1.0.hp,
                        //  10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => User_Profile(
                                id: data.id.toString(),
                              ));
                        },
                        child: Container(
                          child: data.profileicon == ''
                              ? CircleAvatar(
                                  radius: 20.0.sp,
                                  backgroundColor: Colors.white,
                                  backgroundImage: const AssetImage(
                                      "images/profile_icon.png"),
                                  // backgroundImage:
                                  //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                                  //  50,
                                )
                              : CircleAvatar(
                                  radius: 20.0.sp,
                                  backgroundImage:
                                      NetworkImage("${data.profileicon}"),
                                  //  50,
                                ),
                        ),
                      ),
                      SizedBox(
                        width: 5.0.sp,
                      ),
                      SizedBox(
                        width: 42.0.wp,
                        child: Text(
                          data.username
                              .toString()
                              .replaceAll(RegExp('@gmail.com'), ''),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 7.0.sp,
                              color: buttonColor1_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0.sp,
                        height: 1.0.hp,
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            setState(() {
                              if (sugestedFrindListController
                                      .requestType[index] ==
                                  "follow") {
                                sugestedFrindListController.requestType[index] =
                                    "requested";
                                followRequestContoller.followRequestPost(
                                    id: data.id.toString());
                              } else {
                                // TODO:if you need to changes the toast message
                                Fluttertoast.showToast(
                                    msg: "Already request send");
                              }

                              // sugestedFrindListController.followUnfollow(
                              //     index: widget.fetchindex,
                              //     userId: data[widget.fetchindex].id,
                              //     privacy: visible);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0.sp),
                              border: Border.all(color: animagiee_CL, width: 2),
                              color: animagiee_CL,
                            ),
                            height: 4.0.hp,
                            // 30,
                            width: 32.0.wp,
                            // 117,
                            alignment: Alignment.center,
                            child: Text(
                              sugestedFrindListController.requestType[index]
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
                ),
              );
            },
          );
        }
      }),
    );
  }
}
