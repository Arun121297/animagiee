import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/constant.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/userprofile/controller/other_user_controller.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherUserFollowingView extends StatefulWidget {
  String id;

  OtherUserFollowingView({super.key, required this.id});

  @override
  State<OtherUserFollowingView> createState() => _OtherUserFollowingViewState();
}

class _OtherUserFollowingViewState extends State<OtherUserFollowingView> {
  OtherUserController controller = Get.put(OtherUserController());
  Controller dashboardController = Get.put(Controller());

  String userId = "";
  @override
  void initState() {
    fetchData();
    fetcProfile();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await controller.getFollowing(id: widget.id);
    });
  }

  fetcProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getString(Constant.userId)!;
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
        title: Text("Following",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    color: availabletime_CL,
                    fontWeight: FontWeight.w600))),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isFollowingLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.followingData.isEmpty ||
            controller.followingData.first.data!.isEmpty) {
          return const Center(child: Text("No result found"));
        } else {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: controller.followingData.first.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = controller.followingData.first.data![index];
                return Stack(children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: mywork_container_CL))),
                    height: 70,
                    child: InkWell(
                      onTap: () {
                        if (data.userId.toString() == userId) {
                          dashboardController.selectedIndex(4);
                          Get.off(() => Home_Page());
                        } else {
                          Get.to(() => User_Profile(
                                id: data.userId!.toString(),
                                postId: "",
                              ));
                        }
                      },
                      child: Row(
                        children: [
                          data.profileImage!.isEmpty
                              ? CircleAvatar(
                                  radius: 20.0.sp,
                                  // backgroundColor: animagiee_CL,
                                  backgroundImage: const AssetImage(
                                      "images/profile_icon.png"),
                                  // backgroundImage:
                                  //     NetworkImage("${data[widget.fetchindex].profileicon}"),
                                  //  50,
                                )
                              : CircleAvatar(
                                  radius: 20.0.sp,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data.profileImage ?? ""),
                                    // backgroundColor: animagiee_CL,
                                    radius: 40.0.sp,
                                  ),
                                ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 55.0.wp,
                            child: Padding(
                              padding: EdgeInsets.only(right: 4.0.wp),
                              child: Text(
                                data.username ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: availabletime_CL,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  data.userId.toString() == userId
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(left: 75.0.wp, top: 6.0.wp),
                          child: GestureDetector(
                            onTap: () {
                              controller.followingFollow(
                                  userId: data.userId, index: index);
                            },
                            child: Container(
                              height: 3.0.hp,
                              // 26,
                              width: 25.0.wp,
                              // 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: animagiee_CL,
                                  borderRadius: BorderRadius.circular(15.0.sp)),
                              child: Obx(
                                () => Text(
                                  controller.followingStatus[index],
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
                        ),
                ]);
              });
        }
      }),
    );
  }
}
