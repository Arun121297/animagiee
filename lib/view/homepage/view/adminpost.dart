import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/createpost/view/videoplayer.dart';
import 'package:animagieeui/view/homepage/view/share.dart';

import 'package:animagieeui/view/homepage/view/suggestion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../userprofile/view/userprofile.dart';
import '../controller/homescreen1controller.dart';
import 'bookmark.dart';
import 'commend.dart';
import 'likes.dart';

class Admin_Post extends StatefulWidget {
  const Admin_Post({Key? key}) : super(key: key);

  @override
  State<Admin_Post> createState() => _Admin_PostState();
}

class _Admin_PostState extends State<Admin_Post> {
  Controller controller = Get.put(Controller());
  UserPostListController userPostListController =
      Get.put(UserPostListController());

  // @override
  // void initState() {
  //   log("sdatassss_____---->${userPostListController.data}");
  //   super.initState();
  // }

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
              itemCount: userPostListController.data.length,
              itemBuilder: (context, index) {
                var data = userPostListController.data;
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
                                  Get.to(User_Profile(
                                    id: data[index].postowner!.id.toString(),
                                  ));
                                },
                                child: CircleAvatar(
                                  // decoration:
                                  //     BoxDecoration(shape: BoxShape.circle),
                                  // child: ClipRRect(
                                  //   child: CachedNetworkImage(
                                  //       fit: BoxFit.cover,
                                  //       // alignment: Alignment.center,
                                  //       placeholder: (context, url) => SizedBox(
                                  //           height: 5,
                                  //           width: 5,
                                  //           child:
                                  //               const CircularProgressIndicator()),
                                  //       imageUrl:
                                  //           data[index].profileicon.toString()),
                                  // ),

                                  backgroundImage: NetworkImage(
                                      // placeholder: ((context, url) =>
                                      //     CircularProgressIndicator()),
                                      // imageUrl:
                                      data[index].profileicon.toString()),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(User_Profile(
                                    id: data[index].postowner!.id.toString(),
                                  ));
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
                              Expanded(child: Container()),
                              GestureDetector(
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
                          userPostListController.data[index].posttype == "image"
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
                                ),
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
                              children: [
                                Text(
                                  "${data[index].likecount} Likes",
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
                                  "${data[index].postViewCount} Views",
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
                            const Likes_UI(),
                            SizedBox(
                              width: 2.0.wp,
                            ),
                            const Comment_UI(),
                            SizedBox(
                              width: 1.8.wp,
                            ),
                            const Share_UI(),
                            Expanded(child: Container()),
                            const BookMarkUI(),
                          ]),
                          SizedBox(height: 2.0.sp
                              //  10,
                              ),
                        ],
                      ),
                    ),
                    Visibility(
                        visible: index == 1 ? true : false,
                        child: Suggested_For_You_UI()),
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
