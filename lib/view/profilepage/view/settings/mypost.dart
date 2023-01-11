import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';
import '../../../homeAppBar/view/appbar.dart';
import '../../../homepage/view/commend.dart';
import '../../../homepage/view/commentscreen.dart';
import '../../../homepage/view/likes.dart';
import '../../../homepage/view/share.dart';
import '../../../homepage/widgets/home_widget.dart';
import '../../../homepage/widgets/share_home.dart';
import '../../controller/currentuserpostlistcontroller.dart';

class My_Post_UI extends StatefulWidget {
  var id;
  My_Post_UI({Key? key, this.id}) : super(key: key);

  @override
  State<My_Post_UI> createState() => _My_Post_UIState();
}

class _My_Post_UIState extends State<My_Post_UI> {
  Controller controller = Get.put(Controller());
  CurrentUserlistController currentUserlistController =
      Get.put(CurrentUserlistController());
  LikeContoller likeContoller = Get.put(LikeContoller());
  FavouriteController favouriteController = Get.put(FavouriteController());
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await currentUserlistController.getmyProfilelist(widget.id);
    });
  }

  likePost({required String id, required int index}) async {
    await likeContoller.like(id: id, index: index);
    currentUserlistController.currentuserlist.first.data![index].liked =
        !currentUserlistController.currentuserlist.first.data![index].liked!;
    if (currentUserlistController.currentuserlist.first.data![index].liked!) {
      currentUserlistController.currentuserlist.first.data![index].likeCount =
          currentUserlistController
                  .currentuserlist.first.data![index].likeCount! +
              1;
      log("${currentUserlistController.currentuserlist.first.data![index].likeCount}true");
    } else {
      currentUserlistController.currentuserlist.first.data![index].likeCount =
          currentUserlistController
                  .currentuserlist.first.data![index].likeCount! -
              1;
      log("${currentUserlistController.currentuserlist.first.data![index].likeCount}false");
    }
    setState(() {});
  }

  addToFavourite({required id, required index}) async {
    await favouriteController.addToFavourite(postId: id);
    currentUserlistController.currentuserlist.first.data![index].saved =
        !currentUserlistController.currentuserlist.first.data![index].saved!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (currentUserlistController.iscurrentpostloading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (currentUserlistController.currentuserlist.isEmpty ||
          currentUserlistController.currentuserlist.first.data!.isEmpty) {
        return const Center(
          child: Text("No data found"),
        );
      } else {
        var data = currentUserlistController.currentuserlist.first;
        return SafeArea(
          child: Column(
            children: [
              AppbarContainer(
                title: "My Profile",
                backarrow: true,
                chat: false,
                notification: true,
                search: true,
                logo: false,
                edit: false,
                searchfunction: true,
                searchfunctionclose: false,
                notification_back_arrow: false,
                firstscreen: false,
                navipage: null,
                podcast: false,
                fun: Home_Page(),
              ),

              // controller.clubapp("My Profile", Home_Page(), context),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 11.3.hp,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: data.data!.length,
                      itemBuilder: (context, index) {
                        var listData = data.data![index];
                        return Card(
                          elevation: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  listData.profileicon!.isEmpty
                                      ? CircleAvatar(
                                          // child:
                                          backgroundColor: Colors.black,
                                          backgroundImage: AssetImage(
                                              "images/emptyimage.jfif"),
                                        )
                                      : CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              listData.profileicon.toString()),
                                        ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    listData.username.toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 10.5.sp,
                                        color: buttonColor1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       showModalBottomSheet(
                                  //         context: context,
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.only(
                                  //                 topLeft: Radius.circular(20),
                                  //                 topRight: Radius.circular(20))),
                                  //         builder: (context) {
                                  //           return Container(
                                  //             height: 174,
                                  //             width: MediaQuery.of(context).size.width,
                                  //             child: Column(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceEvenly,
                                  //               children: [
                                  //                 Text(
                                  //                   "Unfollow",
                                  //                   style: GoogleFonts.poppins(
                                  //                     textStyle: TextStyle(
                                  //                       fontSize: 10.0.sp,
                                  //                       color: club_Text_1,
                                  //                       fontWeight: FontWeight.w500,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 Divider(
                                  //                   color: Colors.black,
                                  //                   endIndent: 30,
                                  //                   indent: 30,
                                  //                   // height: 5,
                                  //                 ),
                                  //                 Text(
                                  //                   "Report",
                                  //                   style: GoogleFonts.poppins(
                                  //                     textStyle: TextStyle(
                                  //                       fontSize: 10.0.sp,
                                  //                       color: club_Text_1,
                                  //                       fontWeight: FontWeight.w500,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 Divider(
                                  //                   color: Colors.black,
                                  //                   endIndent: 30,
                                  //                   indent: 30,
                                  //                   // height: 5,
                                  //                 ),
                                  //                 Text(
                                  //                   "Block",
                                  //                   style: GoogleFonts.poppins(
                                  //                     textStyle: TextStyle(
                                  //                       fontSize: 10.0.sp,
                                  //                       color: club_Text_1,
                                  //                       fontWeight: FontWeight.w500,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           );
                                  //         },
                                  //       );
                                  //     });
                                  //   },
                                  // child:
                                  GestureDetector(
                                    onTap: () => popupUser(),
                                    child: SizedBox(
                                      height: 2.0.hp,
                                      // 16,
                                      width: 5.0.wp,
                                      // 16,
                                      child: Image.asset(
                                        "images/burger.png",
                                        // cacheHeight: 16,
                                        // cacheWidth: 16,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  listData.description.toString(),
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.5.sp,
                                      color: dummycontent_Cl,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              VisibilityDetector(
                                key: Key(index.toString()),
                                onVisibilityChanged: (visibilityInfo) {
                                  // onVisibilityChanged(
                                  //     VisibilityInfo.visibleFraction,
                                  //     response.postId);
                                },
                                child: GestureDetector(
                                    child: MediaWidget(
                                  mediaType: listData.posttype.toString(),
                                  source: listData.addImagesOrVideos.toString(),
                                )),
                              ),
                              // Container(
                              //   height: 45.0.hp,
                              //   //  346,

                              //   width: 95.0.wp,
                              //   // 346,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     image: DecorationImage(
                              //       image: AssetImage(controller.Home_Post[index]),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: listData.likeCount == 0
                                          ? false
                                          : true,
                                      child: Text(
                                        "${listData.likeCount.toString()} Likes",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 9.0.sp,
                                            color: TextContent1_CL,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: Text(
                                        "12 Comments",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 9.0.sp,
                                            color: TextContent1_CL,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Visibility(
                                      visible: false,
                                      child: Text(
                                        "100 Views",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 9.0.sp,
                                            color: TextContent1_CL,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(children: [
                                Likes_UI(
                                  onTap: () {
                                    likePost(
                                        id: listData.postid ?? "",
                                        index: index);
                                  },
                                  status: listData.liked!,
                                ),
                                Comment_UI(),
                                // const Share_UI(),
                                ShareHome(
                                  desc: listData.description.toString(),
                                  id: listData.postid!.toString(),
                                  image: listData.addImagesOrVideos.toString(),
                                  title: listData.username.toString(),
                                ),
                                Expanded(child: Container()),
                                FavouriteIcon(
                                    onTap: () {
                                      addToFavourite(
                                          id: listData.postid, index: index);
                                    },
                                    status: listData.saved),
                              ])
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      }
    }));
  }

  popupUser() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 20.0.hp,
          //  174,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Delete",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black,
                endIndent: 30,
                indent: 30,
                // height: 5,
              ),
              Text(
                "Edit",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // const Divider(
              //   color: Colors.black,
              //   endIndent: 30,
              //   indent: 30,
              //   // height: 5,
              // ),
              // Text(
              //   "Block",
              //   style: GoogleFonts.poppins(
              //     textStyle: TextStyle(
              //       fontSize: 10.0.sp,
              //       color: club_Text_1,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
