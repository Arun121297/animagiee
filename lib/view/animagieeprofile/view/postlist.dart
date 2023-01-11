import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/homepage/widgets/home_widget.dart';
import 'package:animagieeui/view/instancepage/controller/communityPotsListController.dart';
import 'package:animagieeui/view/instancepage/controller/likeController.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../config/colorconfig.dart';
import '../../homepage/view/commend.dart';
import '../../homepage/view/commentscreen.dart';
import '../../homepage/view/likes.dart';
import '../../homepage/view/share.dart';
// import '../../homepage/bookmark.dart';
// import '../../homepage/commend.dart';
// import '../../homepage/likes.dart';
// import '../../homepage/share.dart';

class PostList_Content extends StatefulWidget {
  int index;
  String? myUserId;
  PostList_Content({Key? key, required this.index, required this.myUserId})
      : super(key: key);

  @override
  State<PostList_Content> createState() => _PostList_ContentState();
}

class _PostList_ContentState extends State<PostList_Content> {
  Controller controller = Get.put(Controller());

  CommunityPostListContoller communityPostListContoller = Get.find();
  LikeContoller likeContoller = Get.put(LikeContoller());
  FavouriteController favouriteController = Get.put(FavouriteController());
  likePost({required String id, required int index}) {
    likeContoller.like(id: id, index: index);
    communityPostListContoller.communityPostListData[0].data![index].liked =
        !communityPostListContoller
            .communityPostListData[0].data![index].liked!;
    if (communityPostListContoller
        .communityPostListData[0].data![index].liked!) {
      communityPostListContoller.communityPostListData[0].data![index]
          .likecount = communityPostListContoller
              .communityPostListData[0].data![index].likecount! +
          1;
      log("${communityPostListContoller.communityPostListData[0].data![index].likecount}true");
    } else {
      communityPostListContoller.communityPostListData[0].data![index]
          .likecount = communityPostListContoller
              .communityPostListData[0].data![index].likecount! -
          1;
      log("${communityPostListContoller.communityPostListData[0].data![index].likecount}false");
    }
    setState(() {});
  }

  addToFavourite({required id, required index}) async {
    await favouriteController.addToFavourite(postId: id);
    var data =
        communityPostListContoller.communityPostListData.first.data![index];
    data.saved = !data.saved!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = communityPostListContoller
          .communityPostListData.first.data![widget.index];
      return Column(
        children: [
          Card(
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),

                    data.postowner!.profileicon!.isEmpty
                        ? const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                ExactAssetImage("images/profile_icon.png"),
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.postowner!.profileicon ?? ""),
                          ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    SizedBox(
                      width: 70.0.wp,
                      child: Text(
                        data.postowner!.username ?? "",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.5.sp,
                            color: buttonColor1_CL,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0.wp,
                      //  12,
                    ),
                    data.postowner!.id == widget.myUserId
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                popupUser();
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
                          )
                        : GestureDetector(
                            onTap: () => bottomsheet(),
                            child: SizedBox(
                              height: 2.0.hp,
                              // 16,
                              width: 5.0.wp,
                              // 16,,
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
                    //   onPressed: () {},
                    //   icon: Icon(Icons.menu),
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Text(
                    data.description ?? "",
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
                  key: Key(widget.index.toString()),
                  child: GestureDetector(
                      child: MediaWidget(
                    mediaType: data.posttype!,
                    source: data.addImagesOrVideos!,
                  )),
                  onVisibilityChanged: (visibilityInfo) {
                    // onVisibilityChanged(
                    //     VisibilityInfo.visibleFraction,
                    //     response.postId);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Row(
                    children: [
                      Visibility(
                        visible: data.likecount == 0 ? false : true,
                        child: Text(
                          "${data.likecount.toString()} Likes",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 9.0.sp,
                              color: TextContent1_CL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0.wp
                          // 12,
                          ),
                      // TODO:please add comment count after complete comment
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
                        visible: data.postViewCount == 0 ? false : true,
                        child: Text(
                          "${data.postViewCount}  Views",
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
                      likePost(id: data.postid.toString(), index: widget.index);
                    },
                    status: data.liked!,
                  ),
                  Comment_UI(
                      // ontap: callback(''),
                      // ontap: Get.to(CommentScreenDesign())
                      ),
                  const Share_UI(),
                  Expanded(child: Container()),
                  FavouriteIcon(
                      onTap: () =>
                          addToFavourite(id: data.postid, index: widget.index),
                      status: data.saved)
                ])
              ],
            ),
          ),
        ],
      );
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
          height: 10.0.hp,
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
              // const Divider(
              //   color: Colors.black,
              //   endIndent: 30,
              //   indent: 30,
              //   // height: 5,
              // ),
              // Text(
              //   "Edit",
              //   style: GoogleFonts.poppins(
              //     textStyle: TextStyle(
              //       fontSize: 10.0.sp,
              //       color: club_Text_1,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
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

  bottomsheet() {
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

  callback(variable) {
    return variable;
  }
}
