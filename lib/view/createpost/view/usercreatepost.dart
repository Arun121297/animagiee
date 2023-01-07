import 'dart:io';

import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:animagieeui/view/post/views/trimmer_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// import 'package:animagieeui/view/createpost/view/postmethod.dart';
// import 'package:animagieeui/view/createpost/view/tagpeople.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../bottombarfile/view/bottomnavibar.dart';
// import '../../bottombarfile/view/bottomnavibar.dart';
import '../../homeAppBar/view/appbar.dart';
import 'adddescription.dart';
import 'addphotos.dart';
import 'addvideos.dart';
import 'postmethod.dart';
import 'tagpeople.dart';
import 'creategroup.dart';
// import 'adddescription.dart';
// import 'addphotos.dart';
// import 'addvideos.dart';
// import 'creategroup.dart';
// import 'videoplayer.dart';

class UserProfileCreatePostUI extends StatefulWidget {
  const UserProfileCreatePostUI({Key? key}) : super(key: key);

  @override
  State<UserProfileCreatePostUI> createState() =>
      _UserProfileCreatePostUIState();
}

class _UserProfileCreatePostUIState extends State<UserProfileCreatePostUI> {
  PostController postController = Get.put(PostController());
  String filePath = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    postController.postType("single");
    Future.delayed(Duration.zero, () async {
      postController.getJoinedClub();
    });
  }

  Controller controller = Get.put(Controller());

  void generateThumbnail() {
    if (postController.imagevideo.value.type == 'video' &&
        postController.imagevideo.value.url!.path.isNotEmpty) {
      generateThumbnailForVideo(postController.imagevideo.value.url!.path);
    }
  }

  void generateThumbnailForVideo(String url) async {
    if (url != '') {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: url,
        thumbnailPath: (await path_provider.getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: (SizeConfig.blockSizeVertical! * 35)
            .toInt(), // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        quality: 100,
      );
      // log(fileName!);
      filePath = fileName!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(() {
      if (postController.isJoinedClubLoading.value) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const Customized_Bottom_Bar(),
          body: WillPopScope(
            onWillPop: () {
              return null!;
            },
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppbarContainer(
                    title: "Post",
                    backarrow: false,
                    firstscreen: false,
                    navipage: 0,
                    notification_back_arrow: false,
                    notification: false,
                    edit: false,
                    search: false,
                    searchfunction: true,
                    searchfunctionclose: false,
                    chat: false,
                    logo: false,
                    podcast: false,
                    fun: null,
                  ),
                  // Profile_AppBar_UI(
                  //     edit: false, notification: true, navipage: 0, title: "Post"),
                  // Postfrontscreen(),
                  // controller.clubapp("Post", Home_Page(), context),
                  SizedBox(
                    height: 2.0.hp,
                    //  22,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 6.0.sp),
                              child: Text(
                                "Post Type",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 9.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.0.sp
                                // 12,
                                ),
                            const Post_Method_UI(),
                            SizedBox(height: 8.0.wp
                                // 24,
                                ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0.sp),
                              child: Text(
                                "Select group",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 9.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.0.hp
                                //  12,
                                ),
                            const CreatePostUI(),
                            SizedBox(height: 1.0.hp
                                //  12,
                                ),
                            const EmogieDescriptionUI(),
                            // SizedBox(
                            //   height: 24,
                            // ),
                            /*   Align(
                              alignment: Alignment.center,
                              child: Visibility(
                                visible:
                                    controller.file.path.isEmpty ? false : true,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      if (controller.imagevideo.value.type ==
                                          "image") {
                                        return Container(
                                          height: 20.0.hp,
                                          //  134,
                                          width: 93.0.wp,
                                          // 339,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(File(controller
                                                  .imagevideo.value.url
                                                  .toString())),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0.sp),
                                            border: Border.all(
                                                width: 2, color: animagiee_CL),
                                          ),
                                        );
                                      } else {
                                        return Container(
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
                                            urls: controller
                                                .imagevideo.value.url
                                                .toString(),
                                          ),
                                        );
                                      }
                                    })
                                  ],
                                ),
                              ),
                            ),
                            */
                            postController.imagevideo.value.type!.isEmpty
                                ? const SizedBox()
                                : postController.imagevideo.value.type ==
                                        "image"
                                    ? Column(
                                        children: [
                                          Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 04,
                                                      horizontal: 08),
                                              height: SizeConfig
                                                      .blockSizeVertical! *
                                                  04,
                                              child: Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.spaceBetween,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  // InkWell(
                                                  //   onTap: () {
                                                  //     postController.cropImage(
                                                  //         postController
                                                  //             .image.value);
                                                  //   },
                                                  //   child: Row(
                                                  //     children: [
                                                  //       Container(
                                                  //           child:
                                                  //               Text('Crop again')),
                                                  //       Icon(
                                                  //         Icons.crop,
                                                  //         size: SizeConfig
                                                  //                 .blockSizeHorizontal! *
                                                  //             5,
                                                  //       )
                                                  //     ],
                                                  //   ),
                                                  // ),
                                                  InkWell(
                                                    onTap: () {
                                                      postController.fileType
                                                                  .value !=
                                                              "camera"
                                                          ? postController
                                                              .pickFileFromGallery(
                                                                  generateThumbnail,
                                                                  FileType
                                                                      .image)
                                                          : postController
                                                              .pickCamera();
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          postController
                                                                      .fileType
                                                                      .value !=
                                                                  "camera"
                                                              ? 'Upload again'
                                                              : "Pick again",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons.upload_rounded,
                                                          color: animagiee_CL,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: bg_color33,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            height: 250,
                                            //  134,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Image.file(File(
                                                postController.imagevideo.value
                                                    .url!.path)),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          SizedBox(
                                              height: SizeConfig
                                                      .blockSizeVertical! *
                                                  01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 04),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10, left: 10),
                                                  height: SizeConfig
                                                          .blockSizeVertical! *
                                                      04,
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.to(() => TrimmerView(
                                                                file: postController
                                                                    .imagevideo
                                                                    .value
                                                                    .url!,
                                                                duration: 30,
                                                              ))!
                                                          .then((value) =>
                                                              generateThumbnail());
                                                    },
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                            'Trim again'),
                                                        Icon(
                                                          Icons.cut,
                                                          size: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              5,
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 04),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 10, right: 10),
                                                  height: SizeConfig
                                                          .blockSizeVertical! *
                                                      04,
                                                  child: InkWell(
                                                    onTap: () {
                                                      postController
                                                          .pickFileFromGallery(
                                                              generateThumbnail,
                                                              FileType.video);
                                                      // await postController
                                                      //     .pickVideoFromGallery();
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Upload again',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: 11.0.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Icons.upload_rounded,
                                                          color: animagiee_CL,
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Container(
                                            color: Colors.grey[200],
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: SizeConfig.screenWidth,
                                                  height: 250,
                                                  child: filePath != ''
                                                      ? Image.file(
                                                          File(filePath),
                                                          fit: BoxFit.contain,
                                                        )
                                                      : Center(
                                                          child: Transform.scale(
                                                              scale: 0.8,
                                                              child:
                                                                  const CircularProgressIndicator()),
                                                        ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                            SizedBox(
                              height: 1.0.hp,
                            ),
                            SizedBox(
                              width: 97.0.wp,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddPhotosUI(
                                      thumbnail: generateThumbnail,
                                    ),
                                    AddVideoUI(
                                      thumbnail: generateThumbnail,
                                    )
                                  ]),
                            ),

                            const Tag_People_UI(),
                            SizedBox(
                              height: 3.0.hp,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () async {
                                  await postController.individualpost(context);
                                  // controller.selectedIndex.value = 0;
                                },
                                child: Container(
                                  height: 6.0.hp,
                                  width: 90.0.wp,
                                  // 310,
                                  decoration: BoxDecoration(
                                      color: buttonColor1_CL,
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Post",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        color: SigninButton_CL,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 2.5.sp)
                            // 10,
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  // Postfrontscreen() {
  //   return Material(
  //     elevation: 3,
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       child: Row(children: [
  //         IconButton(
  //           icon: Icon(
  //             Icons.arrow_back_ios_new,
  //             size: 12.0.sp,
  //           ),
  //           onPressed: () {
  //             controller.selectedIndex.value = 0;
  //             // Get.to(fun);
  //           },
  //         ),
  //         Expanded(child: SizedBox()),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 30.0),
  //           child: Text(
  //             "Post",
  //             style: GoogleFonts.poppins(
  //               textStyle: TextStyle(
  //                 fontSize: 10.5.sp,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(child: Container()),
  //         Search_UI(),
  //         Notification_UI(),
  //         SizedBox(
  //           width: 3.0.wp,
  //         )
  //       ]),
  //     ),
  //   );
  // }
}
