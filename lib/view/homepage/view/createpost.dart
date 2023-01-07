import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:animagieeui/view/userprofile/view/userprofile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'postcreation.dart';

class CreatePost extends StatefulWidget {
  CreatePost({Key? key, required this.profileImage, required this.userId})
      : super(key: key);
  String? profileImage;
  String? userId;

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  Controller controller = Get.put(Controller());
  PostController postController = Get.put(PostController());
  String filePath = "";
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
    return GestureDetector(
      onTap: () {
        Get.to(() => const Post());
      },
      child: Container(
        height: 9.0.hp,
        //  83,
        color: Colors.white70,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 5.0.wp,
            ),
            GestureDetector(
              onTap: () {
                controller.selectedIndex(4);
              },
              child: widget.profileImage!.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(widget.profileImage ?? ""))
                  : const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          ExactAssetImage("images/profile_icon.png")),
            ),
            const VerticalDivider(color: Colors.transparent, width: 13),
            Container(
                width: 60.0.wp,
                // 218,
                height: 6.0.hp,
                // 43,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    )),
                child: Text(
                  "  Write something here...",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: TextContent3_CL,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            SizedBox(
              width: 3.0.wp,
            ),
            // VerticalDivider(color: Colors.transparent, width: 13),
            GestureDetector(
              onTap: () {
                // filepicker();
                // filepickervideo();
                postController.pickFileFromGallery(
                    generateThumbnail, FileType.any);
                // setState(() {});
              },
              child: SizedBox(
                  height: 5.0.hp,
                  width: 7.0.wp,
                  child: Image.asset("images/photovideos.png")),
            ),
            SizedBox(
              width: 5.0.wp,
            ),
          ],
        ),
      ),
    );
  }
}
