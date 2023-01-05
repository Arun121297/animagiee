import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/createpost/better_player.dart';
import 'package:animagieeui/view/createpost/view/videoplayer.dart';
import 'package:animagieeui/view/homepage/widgets/home_widget.dart';
import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:animagieeui/view/instancepage/controller/userprofile_getpost.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../homepage/view/bookmark.dart';
import '../../homepage/view/commend.dart';
import '../../homepage/view/likes.dart';
import '../../homepage/view/share.dart';

class UserProfile_Page1_UI extends StatefulWidget {
  String id;

  UserProfile_Page1_UI({
    required this.id,
  });

  @override
  State<UserProfile_Page1_UI> createState() => _UserProfile_Page1_UIState();
}

class _UserProfile_Page1_UIState extends State<UserProfile_Page1_UI> {
  Controller controller = Get.put(Controller());
  UserPostGetProfilePostController userPostProfilePostController =
      Get.put(UserPostGetProfilePostController());
  LikeContoller likeContoller = Get.put(LikeContoller());
  @override
  void initState() {
    userPostProfilePostController.userProfilePost(widget.id);
    super.initState();
  }

  likePost({required String id, required int index}) {
    likeContoller.like(id: id, index: index);
    userPostProfilePostController.data[0].data![index].liked =
        !userPostProfilePostController.data[0].data![index].liked!;
    if (userPostProfilePostController.data[0].data![index].liked!) {
      userPostProfilePostController.data[0].data![index].likeCount =
          userPostProfilePostController.data[0].data![index].likeCount! + 1;
      log("${userPostProfilePostController.data[0].data![index].likeCount}true");
    } else {
      userPostProfilePostController.data[0].data![index].likeCount =
          userPostProfilePostController.data[0].data![index].likeCount! - 1;
      log("${userPostProfilePostController.data[0].data![index].likeCount}false");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userPostProfilePostController
              .userprofilescreenloadingindicator.value ==
          true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (userPostProfilePostController.data.isEmpty) {
        return const Center(child: Text("No result found"));
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 250,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: userPostProfilePostController.data[0].data!.length,
            itemBuilder: (context, index) => Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            userPostProfilePostController
                                .data[0].data![index].profileicon
                                .toString()),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        userPostProfilePostController
                            .data[0].data![index].username
                            .toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: buttonColor1_CL,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0.wp,
                      ),
                      Container(),
                      GestureDetector(
                        onTap: () => btmsheet(),
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
                      // IconButton(
                      //   onPressed: () {

                      //   },
                      //   icon: Icon(Icons.menu),
                      // )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.sp, top: 5.0.sp),
                    child: Text(
                      userPostProfilePostController
                          .data[0].data![index].description
                          .toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.0.sp,
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
                      mediaType: userPostProfilePostController
                          .data[0].data![index].posttype!,
                      source: userPostProfilePostController
                          .data[0].data![index].addImagesOrVideos!,
                    )),
                    onVisibilityChanged: (visibilityInfo) {
                      // onVisibilityChanged(
                      //     VisibilityInfo.visibleFraction,
                      //     response.postId);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "${userPostProfilePostController.data[0].data![index].likeCount} Likes",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: TextContent1_CL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          " ${userPostProfilePostController.data[0].data![index].cmdCount} Comments",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: TextContent1_CL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 47.0.wp,
                        ),
                        Text(
                          "${userPostProfilePostController.data[0].data![index].postViewPersons.toString()} Views",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: TextContent1_CL,
                              fontWeight: FontWeight.w500,
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
                            id: userPostProfilePostController
                                .data[0].data![index].postid
                                .toString(),
                            index: index);
                      },
                      status: userPostProfilePostController
                          .data[0].data![index].liked!,
                    ),
                    const Comment_UI(),
                    const Share_UI(),
                    SizedBox(
                      width: 50.0.wp,
                    ),
                    FavouriteIcon(
                      onTap: () {},
                      status: true,
                    ),
                  ])
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  btmsheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 174,
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
