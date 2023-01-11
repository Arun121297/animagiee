import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/utils/constance.dart';
import 'package:animagieeui/view/homepage/view/homepage.dart';
import 'package:animagieeui/view/homepage/view/single_post_tag_people.dart';
import 'package:animagieeui/view/post/views/trimmer_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import '../../../config/colorconfig.dart';
import '../../homeAppBar/view/appbar.dart';
import '../../post/controllers/post_controller.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  PostController controller = Get.put(PostController());
  Controller dashboardController = Get.put(Controller());
  String filePath = "";

  @override
  void initState() {
    // Get.delete<UserPostListController>();
    controller.filepick(File(''));
    controller.description.text = '';
    fetchData();
    super.initState();
  }

  fetchData() async {
    controller.filepick(File(""));
    controller.imagevideo(PostFilepickerType(type: "", url: File("")));
    controller.description.clear();
    controller.fileType("");
    controller.selectedUserList = "";
    controller.tagPeople.clear();
    controller.tagPeopleList.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    controller.userId(sharedPreferences.getString(Constants.userId));
    controller
        .profileImage(sharedPreferences.getString(Constants.profileImage));
    controller.userName(sharedPreferences.getString(Constants.userName));
  }
  // @override
  // void dispose() {

  //   super.dispose();
  // }

// HomescreenCreatePost homescreenCreatePost = Get.put(HomescreenCreatePost());

  void generateThumbnail() {
    if (controller.imagevideo.value.type == 'video' &&
        controller.imagevideo.value.url!.path.isNotEmpty) {
      generateThumbnailForVideo(controller.imagevideo.value.url!.path);
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
      return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar:
        body: SafeArea(
          child: Column(
            children: [
              AppbarContainer(
                title: "Create Post",
                backarrow: true,
                firstscreen: false,
                navipage: null,
                notification: false,
                searchfunction: true,
                searchfunctionclose: false,
                edit: false,
                notification_back_arrow: false,
                search: false,
                chat: false,
                logo: false,
                podcast: false,
                fun: Home_Page(),
              ),

              // controller.chatapp("Create Post", Home_Page(), context),
              const SizedBox(
                height: 19,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    controller.profileImage.isEmpty
                        ? CircleAvatar(
                            backgroundImage:
                                AssetImage("images/emptyimage.jfif"),
                            radius: 30.0.sp,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.profileImage.value),
                            radius: 30.0.sp,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50.0.wp,
                          child: RichText(
                            softWrap: false,
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: controller.userName.value,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              /*defining default style is optional */
                              children: <TextSpan>[
                                /*  TextSpan(
                                  text: ' with',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 10.5.sp,
                                      color: const Color(0xff898989),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: " arun and ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 10.5.sp,
                                      color: const Color(0xff898989),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                 */

                                TextSpan(
                                  // TODO: need to change this word
                                  text: controller.tagPeople.isEmpty
                                      ? ""
                                      : '\n Tagged Peoples: ${controller.tagPeople.length.toString()} ',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 10.5.sp,
                                      color: const Color(0xff898989),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        // Text(
                        //   "Karthi",
                        //   style: GoogleFonts.poppins(
                        //     textStyle: TextStyle(
                        //       fontSize: 12.0.sp,
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        // Text(
                        //   "# Karthi post ",
                        //   style: GoogleFonts.poppins(
                        //     textStyle: TextStyle(
                        //       fontSize: 8.0.sp,
                        //       color: Colors.grey,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: 2.0.wp,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.individualpost(context).then((value) {
                          if (value!) {
                            dashboardController.selectedIndex(0);
                            Get.off(() => Home_Page());
                          }
                        });
                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        width: 22.0.wp,
                        //  80,
                        height: 4.5.hp,
                        // 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: animagiee_CL,
                        ),
                        child: Text(
                          "Post",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 11.0.sp,
                              color: skip_CL,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 1.5.hp
                  // 42,
                  ),
              Column(
                children: [
                  Container(
                    height: 15.0.hp,
                    //  354,
                    width: 350,
                    // MediaQuery.of(context).size.width,
                    // color: Colors.orange,
                    margin: EdgeInsets.only(left: 5.0.sp),
                    child: TextField(
                      controller: controller.description,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration.collapsed(
                          hintStyle: GoogleFonts.jost(
                            textStyle: TextStyle(
                              fontSize: 18.5.sp,
                              color: text_1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          hintText: 'What’s on your mind ?'),
                    ),
                  ),
                  controller.imagevideo.value.type!.isEmpty
                      ? const SizedBox()
                      : controller.imagevideo.value.type == "image"
                          ? Column(
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 04, horizontal: 08),
                                    height: SizeConfig.blockSizeVertical! * 04,
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                            controller.fileType.value !=
                                                    "camera"
                                                ? controller
                                                    .pickFileFromGallery(
                                                        generateThumbnail,
                                                        FileType.image)
                                                : controller.pickCamera();
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                controller.fileType.value !=
                                                        "camera"
                                                    ? 'Upload again'
                                                    : "Pick again",
                                                textAlign: TextAlign.right,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 11.0.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
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
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Image.file(File(
                                      controller.imagevideo.value.url!.path)),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(
                                    height: SizeConfig.blockSizeVertical! * 01),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 04),
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10),
                                        height:
                                            SizeConfig.blockSizeVertical! * 04,
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(() => TrimmerView(
                                                      file: controller
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
                                              const Text('Trim again'),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 04),
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        height:
                                            SizeConfig.blockSizeVertical! * 04,
                                        child: InkWell(
                                          onTap: () {
                                            controller.pickFileFromGallery(
                                                generateThumbnail,
                                                FileType.video);
                                            // await postController
                                            //     .pickVideoFromGallery();
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'Upload again',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontSize: 11.0.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
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

                  /*  Visibility(
                    visible:
                        controller.filepick.value.path.isEmpty ? false : true,
                    child: InkWell(
                      onTap: () {
                        // filepicker();

                        controller.pickFileFromGallery().then((value) {
                          setState(() {});
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Upload again",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 11.0.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.upload,
                                color: animagiee_CL,
                              )
                            ],
                          )),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible:
                          controller.filepick.value.path.isEmpty ? false : true,
                      child: controller.imagevideo.value.type == "image"
                          ? Container(
                              height: 250,
                              //  134,
                              width: MediaQuery.of(context).size.width,
                              // 339,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   fit: BoxFit.cover,
                                //   image: FileImage(File(homescreenCreatePost
                                //       .imagevideo.value.url
                                //       .toString())),
                                // ),
                                borderRadius: BorderRadius.circular(8.0.sp),
                              ),
                              child: Image.file(
                                  File(controller.imagevideo.value.url!.path)))
                          : Container(
                              height: 250,
                              //  134,
                              width: MediaQuery.of(context).size.width,
                              // 339,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0.sp),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Video_Player(
                                    urls: controller.imagevideo.value.url!.path
                                    // "/data/user/0/com.example.animagieeui/cache/cache066067_1672382239647.mp4"
                                    ),
                              ),
                            ),

                      // Container(
                      //   height: 250,
                      //   margin: EdgeInsets.all(15),
                      //   width: MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(
                      //     // color: Colors.amber,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Image.file(homescreenCreatePost.filepick,
                      //       fit: BoxFit.cover),
                      // ),
                    ),
                  )
                */
                ],
              ),

              Visibility(
                  visible: controller.imagevideo.value.url!.path.isEmpty
                      ? true
                      : false,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 250,
                  )),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    GestureDetector(
                      onTap: () {
                        // filepicker();
                        // filepickervideo();
                        controller.pickFileFromGallery(
                            generateThumbnail, FileType.any);
                        // setState(() {});
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.0.wp,
                            ),
                            SizedBox(
                              height: 3.0.hp,
                              //  21,
                              width: 7.0.wp,
                              // 27,
                              child: Image.asset(
                                "images/photovideos.png",
                                // cacheHeight: 21,
                                // cacheWidth: 27,
                              ),
                            ),
                            SizedBox(
                              width: 4.0.wp,
                            ),
                            Text(
                              "Photos/video",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: text_2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SinglePostTagPeople());
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.0.wp,
                          ),
                          SizedBox(
                            height: 4.0.hp,
                            //  25,
                            width: 6.0.wp,
                            // 25,
                            child: Image.asset(
                              "images/tagpeople.png",
                              // cacheHeight: 25,
                              // cacheWidth: 25,
                            ),
                          ),
                          SizedBox(
                            width: 4.0.wp,
                          ),
                          Text(
                            "Tag People",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 10.0.sp,
                                color: text_2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        controller.pickCamera();
                        // videocamera();
                        // setState(() {});
                      },
                      child: SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.0.wp,
                            ),
                            SizedBox(
                              height: 3.0.hp,
                              //  22,
                              width: 6.0.wp,
                              // 25,
                              child: Image.asset(
                                "images/camera.png",
                              ),
                            ),
                            SizedBox(
                              width: 4.0.wp,
                            ),
                            Text(
                              "Camera",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: text_2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      );
    });
  }

  filepicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        controller.filepick(File(file.path.toString()));
        // log(controller.filepick.value.path);
        // controller.file = File(result.path);
        file.extension == "jpg" ||
                file.extension == "jpeg" ||
                file.extension == "png"
            ? controller.imagevideo(PostFilepickerType(
                type: "image", url: controller.filepick.value))
            : controller.imagevideo(PostFilepickerType(
                type: "video", url: controller.filepick.value));
        // log("type-->${controller.imagevideo.value.url}");
        // log("type-->${controller.imagevideo.value.type}");
      });
      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      return null;
      // User canceled the picker
    }
    // final ImagePicker imagePicker = ImagePicker();

    // final result = await imagePicker.pickImage(source: ImageSource.gallery);

    // if (result != null) {
    //   setState(() {
    //     homescreenCreatePost.filepick = File(result.path);
    //     log("${homescreenCreatePost.filepick.path}");
    //     // controller.file = File(result.path);
    //     homescreenCreatePost
    //         .imagevideo(PostFilepickerType(type: "image", url: result.path));
    //     homescreenCreatePost
    //         .imagevideo(PostFilepickerType(type: "video", url: result.path));
    //     log("type-->${homescreenCreatePost.imagevideo.value.type}");
    //   });
    // } else {
    //   return null;
    // }
  }
}
