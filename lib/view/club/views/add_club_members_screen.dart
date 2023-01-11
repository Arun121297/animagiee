import 'dart:developer';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/club/controllers/my_club_controller.dart';
import 'package:animagieeui/view/homeAppBar/view/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddClubMembersScreen extends StatefulWidget {
  const AddClubMembersScreen({Key? key}) : super(key: key);

  @override
  State<AddClubMembersScreen> createState() => _AddClubMembersScreenState();
}

class _AddClubMembersScreenState extends State<AddClubMembersScreen> {
  // PostController controller = Get.find();
  MyClubController controller = Get.put(MyClubController());
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
        child: Obx(
      () => Scaffold(
        floatingActionButton: controller.tagPeople.isEmpty
            ? null
            : FloatingActionButton(
                backgroundColor: animagiee_CL,
                onPressed: () {
                  // TODO:please add,add members function after complete backend
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
        body: controller.isMyFriendsLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: animagiee_CL,
                ),
              )
            : controller.myFrinedsList.isEmpty ||
                    controller.myFrinedsList.first.data!.isEmpty
                ? const Center(
                    child: Text("No data found"),
                  )
                : Column(
                    children: [
                      AppbarContainer(
                        title: "Add Members",
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
                            itemCount:
                                controller.myFrinedsList.first.data!.length,
                            itemBuilder: (context, index) {
                              var listData =
                                  controller.myFrinedsList.first.data![index];
                              return Card(
                                child: ListTile(
                                  leading: listData.profileicon!.isEmpty
                                      ? CircleAvatar(
                                          backgroundImage:
                                              const ExactAssetImage(
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
                                        fillColor: MaterialStateProperty.all(
                                            animagiee_CL),
                                        value: controller.tagPeopleList[index],
                                        onChanged: (value) {
                                          log("vvvvvv$value");
                                          controller.tagPeopleList[index] =
                                              value!;
                                          log("con${controller.tagPeople.contains(listData.id.toString())}");
                                          if (controller.tagPeople.contains(
                                              listData.id.toString())) {
                                            controller.tagPeople
                                                .remove(listData.id);
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
                      )
                    ],
                  ),
      ),
    ));
  }
}
