import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/colorconfig.dart';
import '../../config/constant.dart';
import '../../view/homepage/view/bookmark.dart';
import '../../view/homepage/view/commend.dart';
import '../../view/homepage/view/likes.dart';
import '../../view/homepage/widgets/home_widget.dart';
import '../../view/homepage/widgets/share_home.dart';
import '../../view/instancepage/controller/likeController.dart';
import '../controller/singlepostcontroller.dart';

class SinglePostDesign extends StatefulWidget {
  var post;
  SinglePostDesign({super.key, this.post});

  @override
  State<SinglePostDesign> createState() => _SinglePostDesignState();
}

class _SinglePostDesignState extends State<SinglePostDesign> {
  SinglepostController singlepostController = Get.put(SinglepostController());
  LikeContoller likeContoller = Get.put(LikeContoller());

  // @override
  // void didPopNext() {
  //   singlepostController.singlepostcontroller(widget.post);
  //   // Covering route was popped off the navigator.
  // }

  @override
  void initState() {
    log("postId--${widget.post}");
    fetchdata();
    // TODO: implement initState
    super.initState();
  }

  void fetchdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    singlepostController.isLoginUser((prefs.containsKey(Constant.authToken)));
    singlepostController.id((prefs.getString(Constant.userId).toString()));
    singlepostController
        .myProfile(prefs.getString(Constant.userName).toString());
    singlepostController.singlepostcontroller(widget.post);
  }

  likePost({
    required String id,
  }) async {
    await likeContoller.like(
      id: id,
    );
    singlepostController.like = !singlepostController.like;
    if (singlepostController.like) {
      singlepostController.likeCount = singlepostController.likeCount + 1;
      log("likes${singlepostController.likeCount}true");
    } else {
      singlepostController.likeCount = singlepostController.likeCount - 1;
      log("${singlepostController.likeCount}false");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (singlepostController.nullData.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (singlepostController.singlepostlist.isEmpty &&
          singlepostController.message.contains("deleted")) {
        return const Center(
          child: Text("No Post"),
        );
      } else {
        final response = singlepostController.singlepostlist[0];
        return SafeArea(
          child: Column(
            children: [
              Material(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Container(
                          alignment: Alignment.center,
                          height: 7.0.hp,
                          // width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Single Post",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                      const Expanded(
                          child: SizedBox(
                              // width: 50,
                              ))
                    ],
                  )),
              Card(
                elevation: 3,
                child: Column(
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
                        GestureDetector(
                          onTap: () {
                            log(response.postowner!.id.toString());
                            Get.to(User_Profile(
                              id: response.postowner!.id.toString(),
                            ));
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(response.profileicon.toString()),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            log(response.postowner!.id.toString());
                            Get.to(User_Profile(
                              id: response.postowner!.id.toString(),
                            ));
                          },
                          child: Text(
                            response.username.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.5.sp,
                                color: buttonColor1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
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
                        response.description.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: dummycontent_Cl,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.0.hp
                        // 12,
                        ),
//  VisibilityDetector(
                    // key: Key(index.toString()),
                    // child:
                    GestureDetector(
                        child: MediaWidget(
                      mediaType: response.posttype.toString(),
                      source: response.addImagesOrVideos.toString(),
                    )),
                    // onVisibilityChanged: (visibilityInfo) {
                    //   // onVisibilityChanged(
                    //   //     VisibilityInfo.visibleFraction,
                    //   //     response.postId);
                    // },
                    // ),
                    // Container(
                    //   height: 35.0.hp,
                    //   //  346,
                    //   width: 95.0.wp,
                    //   // 346,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15.0.sp),
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           response.addImagesOrVideos.toString()),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: Row(
                        children: [
                          Text(
                            "${response.likecount} Likes",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: TextContent1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0.wp
                              // 12,
                              ),
                          Text(
                            "12 Comments",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.0.sp,
                                color: TextContent1_CL,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "${response.postViewCount} Views",
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
                          setState(() {
                            likePost(
                              id: response.postid ?? "",
                            );
                          });
                        },
                        status: response.liked!,
                      ),
                      // ignore: dead_code

                      const Comment_UI(),

                      const SizedBox(
                        width: 15,
                      ),
                      ShareHome(
                          desc: response.description.toString(),
                          id: response.postid.toString(),
                          image: response.addImagesOrVideos.toString(),
                          title: response.postowner!.username.toString()),
                      Expanded(child: Container()),
                      const BookMarkUI(),
                    ])
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }));
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
}
