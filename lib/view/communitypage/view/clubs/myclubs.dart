import 'dart:developer';
import 'dart:io';

import 'package:animagieeui/chat/group_chat/allConstents/firestore_constants.dart';
import 'package:animagieeui/chat/group_chat/chat_page.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/animagieeprofile/view/animalsprofiles.dart';
import 'package:animagieeui/view/communitypage/controller/createclubcontroller.dart';
import 'package:animagieeui/view/instancepage/controller/clubController.dart';
import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:animagieeui/view/bottombarfile/view/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';
import '../../../homeAppBar/view/appbar.dart';
import '../../../homepage/view/homepage.dart';
import 'createnewclub.dart';
import 'clubcreation/mycreatedclub.dart';
import 'mysubscriptionlist.dart';

class MyClubs_UI extends StatefulWidget {
  const MyClubs_UI({Key? key}) : super(key: key);

  @override
  State<MyClubs_UI> createState() => _MyClubs_UIState();
}

class _MyClubs_UIState extends State<MyClubs_UI> {
  InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
  CreatedClubController createdClubController =
      Get.put(CreatedClubController());
  ClubController clubController = Get.put(ClubController());
  @override
  void initState() {
    controller.clubprofileimage = File("");
    controller.clubbackgroundimage = File("");
    createdClubController.clubcreatedcontroller();
    // TODO: implement initState
    super.initState();
  }

  back() async {
    await Get.to(Home_Page());
  }

  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return back();
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarContainer(
                title: "My Clubs",
                backarrow: true,
                edit: false,
                chat: false,
                notification_back_arrow: false,
                notification: true,
                searchfunction: true,
                searchfunctionclose: false,
                firstscreen: false,
                navipage: null,
                search: true,
                logo: false,
                podcast: false,
                fun: Home_Page(),
              ),
              // controller.clubapp("My Clubs", Home_Page(), context),
              GestureDetector(
                onTap: () {
                  Get.to(const Create_New_Club_UI());
                },
                child: SizedBox(
                  height: 10.0.hp,
                  // 87,
                  // color: Colors.orange,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22.0.sp),
                        child: CircleAvatar(
                            backgroundColor: animagiee_CL,
                            child: IconButton(
                                icon: const Icon(
                                  Icons.person_add,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Get.to(const Create_New_Club_UI());
                                })),
                      ),
                      SizedBox(width: 5.0.sp
                          // 22,
                          ),
                      Text(
                        "Create New Club",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 12.0.sp,
                            color: dummycontent_Cl,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Sub_Container_CL,
                height: 5.0.hp,
                //  35,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "   My Club",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

////
              ///Created Club
              Obx(() {
                if (createdClubController.clubcreatedloadingindicator.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (createdClubController.getcreateclubdata.isEmpty) {
                  return const Center(
                    child: Text("No Club Created"),
                  );
                } else {
                  return SizedBox(
                    height: 25.0.hp,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: createdClubController
                            .getcreateclubdata[0].data!.length,
                        itemBuilder: (context, index) {
                          var listData = createdClubController
                              .getcreateclubdata[0].data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Fluttertoast.showToast(msg: "yes");
                                FirebaseFirestore.instance
                                    .collection(FirestoreConstants.group)
                                    .doc(listData.clubid)
                                    .get()
                                    .then((doc) {
                                  if (doc.exists) {
                                    Get.to(() => GroupChatPage(
                                          peerId: listData.clubid!,
                                          peerAvatar: listData.clubicon!,
                                          peerNickname: listData.clubName!,
                                          currentUserId: listData.clubid!,
                                        ));
                                  } else {
                                    //check other user updated the app?, if not show "This user doesn't have the updated version of the app to chat, "
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            StatefulBuilder(
                                                builder: (context, setState) {
                                              return Dialog(
                                                child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      6,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          bottom: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                        ),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            20,
                                                        width: double.infinity,
                                                        color: animagiee_CL,
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                  right: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.03),
                                                              child: const Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'unable to chat with this  shop!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }));
                                  }
                                });

                                // Get.to(() => ChatListingScreen());
                              },

                              /* onTap: () {
                                // setState(() {
                                //   // Get.to(Animals_Profiles_UI());
                                // });

                                // Get.to(() => GroupChatPage(
                                //       peerId: listData.clubid!,
                                //       peerAvatar: listData.clubicon!,
                                //       peerNickname: listData.clubName!,
                                //       currentUserId: listData.clubid!,
                                //     ));
                              }, */
                              child: Card(
                                child: SizedBox(
                                  height: 7.0.hp,
                                  // 56,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 6.0.wp,
                                        //  16,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            createdClubController
                                                .getcreateclubdata[0]
                                                .data![index]
                                                .clubicon
                                                .toString()),
                                      ),
                                      SizedBox(width: 4.0.wp
                                          //  13,
                                          ),
                                      Text(
                                        createdClubController
                                            .getcreateclubdata[0]
                                            .data![index]
                                            .clubName
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 11.0.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      GestureDetector(
                                        onTap: () {
                                          ///ppass created club id
                                          log("id-->${createdClubController.getcreateclubdata[0].data![index].clubid}");
                                          // Get.to(MyClubCreation());
                                          Get.to(Animals_Profiles_UI(
                                            id: createdClubController
                                                .getcreateclubdata[0]
                                                .data![index]
                                                .clubid
                                                .toString(),
                                            userId: Constants.userId,
                                          ));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Expanded(child: SizedBox()),
                                            Container(
                                              height: 3.5.hp,
                                              //  26,
                                              width: 9.0.wp,
                                              // 90,
                                              alignment: Alignment.center,
                                              // decoration: BoxDecoration(
                                              //     color: animagiee_CL,
                                              //     borderRadius:
                                              //         BorderRadius.circular(
                                              //             5.0.sp)),
                                              child: Text(
                                                "visit",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 9.5.sp,
                                                    color: animagiee_CL,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 10,
                                            ),
                                            // Expanded(child: SizedBox()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 3.0.wp
                                          // 12,
                                          )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
                // Container();
              }),
              Container(
                color: Sub_Container_CL,
                height: 5.0.hp,
                //  35,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Text(
                  "   My Subscriptions",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 11.0.sp,
                      color: dummycontent_Cl,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              instanceContoroller.communitylist.isEmpty
                  ? Align(
                      heightFactor: 15,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text("No Datas"),
                      ),
                    )
                  : Container(
                      color: Colors.transparent,
                      height: 40.0.hp,
                      // MediaQuery.of(context).size.height / 2.1,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: instanceContoroller.communitylist.length,
                          itemBuilder: (context, index) => My_Sub_List_Content(
                                fetchindex: index,
                              )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
