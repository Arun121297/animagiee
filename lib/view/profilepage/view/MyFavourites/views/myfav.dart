import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/controllers/favourite_controller.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/favourite_icon.dart';
import 'package:animagieeui/view/profilepage/view/MyFavourites/widgets/like_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/colorconfig.dart';
import '../../../../homeAppBar/view/appbar.dart';
import '../../../../homepage/view/commend.dart';
import '../../../../homepage/view/commentscreen.dart';
import '../../../../homepage/view/share.dart';
import '../../../../userprofile/view/userprofile.dart';

class My_Favourites_UI extends StatefulWidget {
  const My_Favourites_UI({Key? key}) : super(key: key);

  @override
  State<My_Favourites_UI> createState() => _My_Favourites_UIState();
}

class _My_Favourites_UIState extends State<My_Favourites_UI> {
  FavouriteController controller = Get.put(FavouriteController());

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() {
    Future.delayed(Duration.zero, () async {
      await controller.getFavourite();
    });
  }

  addToFavourite({required id, required index}) {
    controller.addToFavourite(
      postId: id,
    );
    controller.myFavouriteList.first.data!.removeAt(index);
    controller.likeList.removeAt(index);
    setState(() {});
  }

  likeAction({required id, required index}) {
    controller.likeUnLike(postId: id);
    controller.myFavouriteList.first.data![index].liked =
        !controller.myFavouriteList.first.data![index].liked!;
    if (controller.myFavouriteList.first.data![index].liked!) {
      controller.myFavouriteList.first.data![index].likecount =
          controller.myFavouriteList.first.data![index].likecount! + 1;
      log("${controller.myFavouriteList.first.data![index].likecount}true");
    } else {
      controller.myFavouriteList.first.data![index].likecount =
          controller.myFavouriteList.first.data![index].likecount! - 1;
      log("${controller.myFavouriteList.first.data![index].likecount}false");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: AppbarContainer(
            title: "My Favourites",
            backarrow: true,
            chat: false,
            logo: false,
            notification: false,
            notification_back_arrow: false,
            search: false,
            podcast: false,
            edit: false,
            firstscreen: false,
            searchfunction: true,
            searchfunctionclose: false,
            navipage: null,
            fun: Home_Page(),
          ),
        ),
        Obx(() {
          if (controller.isMyFavouriteLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.myFavouriteList.isEmpty ||
              controller.myFavouriteList.first.data!.isEmpty) {
            return SizedBox(
                height: 500, child: Center(child: Text("No data found")));
          } else {
            // controller.clubapp("My Favourites", Home_Page(), context),
            var data = controller.myFavouriteList.first.data;
            return Expanded(
              child: SizedBox(
                height: SizeConfig.screenHeight,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    var listData = data[index];
                    return Card(
                      elevation: 3,
                      child: Column(
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
                                    id: listData.postowner!.id ?? "",
                                  ));
                                },
                                child: listData.postowner!.profileicon!.isEmpty
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            listData.postowner!.profileicon ??
                                                ""),
                                      )
                                    : const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: ExactAssetImage(
                                            "images/profile_icon.png"),
                                      ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(User_Profile(
                                    id: listData.postowner!.id ?? "",
                                  ));
                                },
                                child: SizedBox(
                                  width: 70.0.wp,
                                  child: Text(
                                    listData.postowner!.username ?? "",
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
                              // Container(),
                              SizedBox(
                                width: 5.0.wp,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0.sp),
                                            topRight:
                                                Radius.circular(20.0.sp))),
                                    builder: (context) {
                                      return SizedBox(
                                        height: 20.0.hp,
                                        // height: 174,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Unfollow",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 10.0.sp,
                                                  color: dummycontent_Cl,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.grey,
                                              endIndent: 10,
                                              indent: 10,
                                            ),
                                            Text(
                                              "Report",
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  fontSize: 10.0.sp,
                                                  color: dummycontent_Cl,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.grey,
                                              endIndent: 10,
                                              indent: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                listData.blocked =
                                                    !listData.blocked!;
                                                controller.blockUnblock(
                                                    userId:
                                                        listData.postowner!.id);

                                                Get.back();
                                              },
                                              child: Text(
                                                listData.blocked!
                                                    ? "Unblock"
                                                    : "Block",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 10.0.sp,
                                                    color: dummycontent_Cl,
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
                                },
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
                              // IconButton(
                              //   onPressed: () {
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
                              //                   "UnFollow",
                              //                   style: GoogleFonts.poppins(
                              //                     textStyle: TextStyle(
                              //                       fontSize: 10.0.sp,
                              //                       color: dummycontent_Cl,
                              //                       fontWeight: FontWeight.w500,
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Divider(
                              //                   color: Colors.grey,
                              //                   endIndent: 10,
                              //                   indent: 10,
                              //                 ),
                              //                 Text(
                              //                   "Report",
                              //                   style: GoogleFonts.poppins(
                              //                     textStyle: TextStyle(
                              //                       fontSize: 10.0.sp,
                              //                       color: dummycontent_Cl,
                              //                       fontWeight: FontWeight.w500,
                              //                     ),
                              //                   ),
                              //                 ),
                              //                 Divider(
                              //                   color: Colors.grey,
                              //                   endIndent: 10,
                              //                   indent: 10,
                              //                 ),
                              //                 Text(
                              //                   "Block",
                              //                   style: GoogleFonts.poppins(
                              //                     textStyle: TextStyle(
                              //                       fontSize: 10.0.sp,
                              //                       color: dummycontent_Cl,
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
                              //   icon: Icon(Icons.menu),
                              // )
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  listData.description ?? "",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.5.sp,
                                      color: dummycontent_Cl,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          listData.posttype != "image"
                              ? const SizedBox()
                              : Container(
                                  height: 40.0.hp,
                                  //  346,
                                  width: 95.0.wp,
                                  // 346,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          listData.addImagesOrVideos ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  listData.likecount == 0
                                      ? ""
                                      : "${listData.likecount} Likes",
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
                                  " Comments",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 9.0.sp,
                                      color: TextContent1_CL,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(),
                                Text(
                                  listData.postViewCount == 0
                                      ? ""
                                      : "${listData.postViewCount} Views",
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
                            LikesUI(
                              status: listData.liked,
                              onTap: () =>
                                  likeAction(id: listData.postid, index: index),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Comment_UI(
                                // ontap: callback(''),
                                // ontap: Get.to(CommentScreenDesign())
                                ),
                            const Share_UI(),
                            //   ],
                            // ),
                            // ),
                            // Expanded(child: Container()),
                            SizedBox(
                              width: 50.0.wp,
                            ),
                            FavouriteIcon(
                              onTap: () => addToFavourite(
                                  id: listData.postid, index: index),
                              status: listData.saved,
                            ),
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        })
      ],
    ));
  }

  callback(variable) {
    return variable;
  }
}
