import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/comment/views/commentscreen.dart';
import 'package:animagieeui/utils/constance.dart';

import 'package:animagieeui/view/homepage/view/suggestion.dart';
import 'package:animagieeui/view/homepage/widgets/home_widget.dart';

import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:animagieeui/view/post/controllers/post_view_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

import '../../userprofile/view/userprofile.dart';
import '../controller/homescreen1controller.dart';
import '../controller/mypostdelet.dart';
import '../widgets/share_home.dart';
import 'commend.dart';
import 'commentscreen.dart';
import 'likes.dart';

class AdminPost extends StatefulWidget {
  AdminPost({Key? key, required this.userId}) : super(key: key);
  String? userId;

  @override
  State<AdminPost> createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  Controller controller = Get.put(Controller());
  UserPostListController userPostListController =
      Get.put(UserPostListController());
  LikeContoller likeContoller = Get.put(LikeContoller());
  FavouriteController favouriteController = Get.put(FavouriteController());
  PostViewConroller postViewConroller = Get.put(PostViewConroller());
  MypostDeletController mypostDeletController =
      Get.put(MypostDeletController());
  // @override
  // void initState() {
  //   log("sdatassss_____---->${userPostListController.data}");
  //   super.initState();
  // }
  String? userid;
  // ClubIconController clubIconController = Get.put(ClubIconController());
  // ClubController clubController = Get.put(ClubController());
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  fetchdata() {
    Future.delayed(Duration.zero, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString(Constants.userId);
      print('userid$userid');
      // print('userid->${widget.id}');
    });
  }

  likePost({required String id, required int index}) async {
    await likeContoller.like(id: id, index: index);
    userPostListController.data[0].data![index].liked =
        !userPostListController.data[0].data![index].liked!;
    if (userPostListController.data[0].data![index].liked!) {
      userPostListController.data[0].data![index].likecount =
          userPostListController.data[0].data![index].likecount! + 1;
      log("${userPostListController.data[0].data![index].likecount}true");
    } else {
      userPostListController.data[0].data![index].likecount =
          userPostListController.data[0].data![index].likecount! - 1;
      log("${userPostListController.data[0].data![index].likecount}false");
    }
    setState(() {});
  }

  addToFavourite({required id, required index}) async {
    await favouriteController.addToFavourite(postId: id);
    userPostListController.data.first.data![index].saved =
        !userPostListController.data.first.data![index].saved!;
    setState(() {});
  }

  postView({required id}) async {
    await postViewConroller.postView(postId: id);
  }

  blockUnblock({required userId, required index}) async {
    await favouriteController.blockUnblock(userId: userId).then((value) {
      var data = userPostListController.data.first.data![index];

      if (value) {
        data.blocked = !data.blocked!;
      }
      userPostListController.data.refresh();
      Get.back();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userPostListController.isLoadingService.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (userPostListController.data.isEmpty ||
          userPostListController.data.first.data!.isEmpty) {
        return Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height - 212,
            child: const Text(
              "No User Post",
              style: TextStyle(color: Colors.black),
            ));
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 216,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: userPostListController.data.first.data!.length,
              itemBuilder: (context, index) {
                var data = userPostListController.data.first.data!;
                return Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.userId.toString() ==
                                      data[index].postowner!.id.toString()) {
                                    controller.selectedIndex(4);
                                  } else {
                                    Get.to(() => User_Profile(
                                          id: data[index]
                                              .postowner!
                                              .id
                                              .toString(),
                                        ));
                                  }
                                },
                                child:
                                    data[index].postowner!.profileicon!.isEmpty
                                        ? const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                "images/profile_icon.png"),
                                          )
                                        : CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                data[index]
                                                    .postowner!
                                                    .profileicon
                                                    .toString()),
                                          ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (widget.userId.toString() ==
                                          data[index]
                                              .postowner!
                                              .id
                                              .toString()) {
                                        controller.selectedIndex(4);
                                      } else {
                                        Get.to(() => User_Profile(
                                              id: data[index]
                                                  .postowner!
                                                  .id
                                                  .toString(),
                                            ));
                                      }
                                    },
                                    child: SizedBox(
                                      width: 70.0.wp,
                                      // color: Colors.amber,
                                      child: Text(
                                        data[index].username.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 10.5.sp,
                                            color: buttonColor1_CL,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  data[index].postowner!.username !=
                                          data[index].username
                                      ? SizedBox(
                                          width: 70.0.wp,
                                          child: Text(
                                            "posted by ${data[index].postowner!.username.toString()}",
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 10.0.sp,
                                                color: buttonColor1_CL,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                              SizedBox(
                                width: 5.0.wp,
                                //  12,
                              ),
                              data[index].postowner!.id == widget.userId
                                  ? GestureDetector(
                                      onTap: () {
                                        userpostpopup(
                                            context, data[index].postid);
                                        setState(() {});
                                      },
                                      child: SizedBox(
                                        height: 2.0.hp,
                                        // 16,
                                        width: 5.0.wp,
                                        // 16,
                                        child: Image.asset(
                                          "images/burger.png",
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          popup(
                                              // TODO:please add follow status
                                              followStatus: true,
                                              blocked: data[index].blocked,
                                              postId: data[index].postid,
                                              userId: data[index].postowner!.id,
                                              index: index);
                                        });
                                      },
                                      child: SizedBox(
                                        height: 2.0.hp,
                                        // 16,
                                        width: 5.0.wp,
                                        // 16,
                                        child: Image.asset(
                                          "images/burger.png",
                                        ),
                                      ),
                                    ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Text(
                              data[index].description.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: dummycontent_Cl,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.0.hp,
                            //  12,
                          ),
                          VisibilityDetector(
                            key: Key(index.toString()),
                            child: GestureDetector(
                                child: MediaWidget(
                              mediaType: data[index].posttype.toString(),
                              source: data[index].addImagesOrVideos!,
                            )),
                            onVisibilityChanged: (visibilityInfo) {
                              postView(
                                id: data[index].postid,
                              );
                            },
                          ),

                          /* userPostListController.data[index].posttype == "image"
                              ? Center(
                                  child: Container(
                                    height: 45.0.hp,
                                    //  346,
                                    width: 95.0.wp,
                                    // 346,
                                    alignment: Alignment.center,
                                    // decoration: BoxDecoration(
                                    //   // borderRadius:
                                    //       // BorderRadius.circular(15.0.sp),
                                    // ),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10.0.sp),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          // alignment: Alignment.center,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child: SizedBox(
                                                      height: 10,
                                                      width: 10,
                                                      child:
                                                          CircularProgressIndicator())),
                                          imageUrl: userPostListController
                                              .data[index].addImagesOrVideos
                                              .toString()),
                                    ),
                                  ),
                                )
                              : VisibilityDetector(
                                  onVisibilityChanged: (info) {},
                                  key: Key(index.toString()),
                                  child: Container(
                                    height: 20.0.hp,
                                    //  134,
                                    width: 93.0.wp,
                                    // 339,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(8.0.sp),
                                      border: Border.all(
                                          width: 2, color: animagiee_CL),
                                    ),
                                    child: Video_Player(
                                      urls: userPostListController
                                          .data[index].addImagesOrVideos
                                          .toString(),
                                    ),
                                  ),
                                ), */
                          // Container(
                          //   height: 45.0.hp,
                          //   //  346,
                          //   width: 95.0.wp,
                          //   // 346,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15.0.sp),
                          //     image: DecorationImage(
                          //       image: AssetImage(controller.Home_Post[index]),
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible:
                                      data[index].likecount == 0 ? false : true,
                                  child: Text(
                                    "${data[index].likecount} Likes",
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
                                  visible:
                                      data[index].cmdCount == 0 ? false : true,
                                  child: Text(
                                    "${data[index].cmdCount} Comments",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        color: TextContent1_CL,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(child: Container()),
                                SizedBox(
                                  width: 75.0.wp,
                                ),
                                Visibility(
                                  visible: data[index].postViewCount == 0
                                      ? false
                                      : true,
                                  child: Text(
                                    "${data[index].postViewCount} Views",
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
                              status: data[index].liked!,
                              onTap: () => likePost(
                                  id: data[index].postid.toString(),
                                  index: index),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       callback(
                            //           userimage: data[index]
                            //               .postowner!
                            //               .profileicon
                            //               .toString(),
                            //           username: data[index].postowner!.username,
                            //           postid: data[index].postid.toString());
                            //     });

                            //     // Get.to(CommentScreenDesign(postid: widget.ontap));
                            //   },
                            //   child: Container(
                            //     height: 3.5.hp,
                            //     width: 6.0.wp,
                            //     child: SizedBox(
                            //         height: 2.0.hp,
                            //         width: 5.0.wp,
                            //         child: Image.asset("images/comment.png")),
                            //   ),
                            // ),

                            Comment_UI(
                              postid: data[index].postid,
                              userimage:
                                  data[index].postowner!.profileicon.toString(),
                              username:
                                  data[index].postowner!.username.toString(),
                              //     ontap: callback(
                              //   data[index].postid,
                              // )
                            ),
                            ShareHome(
                              desc: data[index].description.toString(),
                              id: data[index].postid!.toString(),
                              image: data[index].addImagesOrVideos.toString(),
                              title: data[index].postowner!.username.toString(),
                            ),
                            SizedBox(
                              width: 50.0.wp,
                            ),
                            FavouriteIcon(
                              onTap: () => addToFavourite(
                                  id: data[index].postid, index: index),
                              status: data[index].saved,
                            ),

                            // const Share_UI(),
                          ]),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: index == 1 ? true : false,
                        child: const Suggested_For_You_UI()),
                  ],
                );
              }),
        );
      }
    });
  }

  popupUser() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 15.0.hp,
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

  popup(
      {required followStatus,
      required blocked,
      required userId,
      required postId,
      required index}) {
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
                followStatus ? "Unfollow" : "Follow",
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
                "Report",
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
              InkWell(
                onTap: () {
                  blockUnblock(userId: userId, index: index);
                },
                child: Text(
                  blocked ? "Unblock" : "Block",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 10.0.sp,
                      color: club_Text_1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // callback({userimage, postid, username}) {
  //   Get.to(TestMe(
  //     // userimage: userimage,
  //     // username: username,
  //     postid: postid,
  //   )
  //       //   CommentScreenDesign(
  //       //   postid: data,
  //       // )
  //       );
  // }

  userpostpopup(context, postid) {
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
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pop(context);
              //     upcomming(
              //       'Edit Options Comming Soon',
              //     );
              //     setState(() {});
              //   },
              //   child: SizedBox(
              //     child: Text(
              //       "Edit",
              //       style: GoogleFonts.poppins(
              //         textStyle: TextStyle(
              //           fontSize: 10.0.sp,
              //           color: club_Text_1,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // const Divider(
              //   color: Colors.black,
              //   endIndent: 30,
              //   indent: 30,
              //   // height: 5,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  mypostDeletController.mydeletpost(postid).then((value) async {
                    await userPostListController.getHome();
                  });
                  mypostDeletController.mydeletpost(postid);
                  // upcomming(

                  //   'Delete Options Comming Soon',
                  // );
                  setState(() {});
                },
                child: SizedBox(
                  child: Text(
                    "Delete",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  upcomming(title) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, setState) {
              return Dialog(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.width * 0.04,
                        ),
                        height: MediaQuery.of(context).size.height / 20,
                        width: double.infinity,
                        color: animagiee_CL,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));

    // showDialog(
    //     context: context,
    //     builder: (_) {
    //       return AlertDialog(
    //         title: Text('Post Edit Options Comming Zoon'),
    //         content: Text('Post Edit Options Comming Zoon'),
    //         actions: [
    //           TextButton(
    //             onPressed: () => Navigator.pop(context),
    //             child: Text('Cancel'),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               // Send them to your email maybe?

    //               Navigator.pop(context);
    //             },
    //             child: Text('Send'),
    //           ),
    //         ],
    //       );
    //     });
  }
}
