import 'dart:developer';

import 'package:animagieeui/config/extension.dart';

import 'package:animagieeui/view/homepage/view/suggestion.dart';
import 'package:animagieeui/view/homepage/widgets/home_widget.dart';

import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

import '../../userprofile/view/userprofile.dart';
import '../controller/homescreen1controller.dart';
import '../widgets/share_home.dart';
import 'commend.dart';
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

  // @override
  // void initState() {
  //   log("sdatassss_____---->${userPostListController.data}");
  //   super.initState();
  // }

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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userPostListController.isLoadingService.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (userPostListController.data.isEmpty) {
        return Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height - 212,
            child: const Text("No User Post"));
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 212,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: userPostListController.data[0].data!.length,
              itemBuilder: (context, index) {
                var data = userPostListController.data[0].data!;
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
                                          postId: data[index].postid ?? "",
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
                              GestureDetector(
                                onTap: () {
                                  if (widget.userId.toString() ==
                                      data[index].postowner!.id.toString()) {
                                    controller.selectedIndex(4);
                                  } else {
                                    Get.to(() => User_Profile(
                                          postId: data[index].postid ?? "",
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
                                    data[index].postowner!.username.toString(),
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
                              SizedBox(
                                width: 4.0.wp,
                                //  12,
                              ),
                              widget.userId == data[index].postowner!.id
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          popup();
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
                            child: ReadMoreText(
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: '...Read less',
                              data[index].description.toString(),
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: dummycontent_Cl,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              moreStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                      color: bg_color27,
                                      fontWeight: FontWeight.w600)),
                              lessStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.012,
                                      color: bg_color27,
                                      fontWeight: FontWeight.w600)),
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
                              mediaType: data[index].posttype!,
                              source: data[index].addImagesOrVideos!,
                            )),
                            onVisibilityChanged: (visibilityInfo) {
                              // onVisibilityChanged(
                              //     VisibilityInfo.visibleFraction,
                              //     response.postId);
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
                                // TODO:after complete post comment, please remove comment
                                Visibility(
                                  visible: false,
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
                                  width: 45.0.wp,
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
                            const Comment_UI(),
                            ShareHome(
                              desc: data[index].description.toString(),
                              id: data[index].postid!.toString(),
                              image: data[index].addImagesOrVideos.toString(),
                              title: data[index].postowner!.username.toString(),
                            ),
                            SizedBox(
                              width: 57.0.wp,
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

  popup() {
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
                "Unfollow",
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
              Text(
                "Block",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.0.sp,
                    color: club_Text_1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
