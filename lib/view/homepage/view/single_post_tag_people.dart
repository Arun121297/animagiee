import 'dart:developer';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homeAppBar/view/appbar.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SinglePostTagPeople extends StatefulWidget {
  const SinglePostTagPeople({Key? key}) : super(key: key);

  @override
  State<SinglePostTagPeople> createState() => _SinglePostTagPeopleState();
}

class _SinglePostTagPeopleState extends State<SinglePostTagPeople> {
  PostController controller = Get.find();
  @override
  void initState() {
    fetcData();
    super.initState();
  }

  fetcData() {
    log(controller.tagPeopleList.length.toString());
    Future.delayed(Duration.zero, () async {
      await controller.getMyFriends();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (controller.isMyFriendsLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: animagiee_CL,
              ),
            );
          } else if (controller.myFrinedsList.isEmpty ||
              controller.myFrinedsList.first.data!.isEmpty) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            var data = controller.myFrinedsList.first.data;
            return Column(
              children: [
                AppbarContainer(
                  title: "Tag People",
                  backarrow: true,
                  firstscreen: false,
                  navipage: null,
                  notification: false,
                  searchfunction: true,
                  searchfunctionclose: false,
                  edit: false,
                  notification_back_arrow: false,
                  search: false,
                  chat: false,
                  logo: false,
                  podcast: false,
                  fun: "",
                ),

                // controller.chatapp("Create Post", Home_Page(), context),
                const SizedBox(
                  height: 19,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        var listData = data[index];
                        return Card(
                          child: ListTile(
                            leading: listData.profileicon!.isEmpty
                                ? CircleAvatar(
                                    backgroundImage: const ExactAssetImage(
                                        "images/Exotic_Birds.jpg"),
                                    radius: 20.0.sp,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        listData.profileicon ?? ""),
                                    radius: 20.0.sp,
                                  ),
                            title: Text(
                              listData.username ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            trailing: Obx(
                              () => Checkbox(
                                  checkColor: Colors.white,
                                  // hoverColor: animagiee_CL,
                                  fillColor:
                                      MaterialStateProperty.all(animagiee_CL),
                                  value: controller.tagPeopleList[index],
                                  onChanged: (value) {
                                    log("vvvvvv$value");
                                    controller.tagPeopleList[index] = value!;
                                    log("con${controller.tagPeople.contains(listData.id.toString())}");
                                    if (controller.tagPeople
                                        .contains(listData.id.toString())) {
                                      controller.tagPeople.remove(listData.id);
                                    } else {
                                      controller.tagPeople
                                          .add(listData.id ?? "");
                                    }
                                    log(controller.tagPeople.toString());
                                    // setState(() {});
                                  }),
                            ),
                          ),
                        );
                      }),
                ),
                controller.tagPeople.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 5.0.hp),
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: buttonColor1_CL,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Text(
                              "Submit",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: skip_CL,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            );
          }
        }),
      ),
    );
  }
}
