import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class AddVideoUI extends StatefulWidget {
  AddVideoUI({Key? key, required this.thumbnail}) : super(key: key);

  Function thumbnail;

  @override
  State<AddVideoUI> createState() => _AddVideoUIState();
}

class _AddVideoUIState extends State<AddVideoUI> {
  PostController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            controller.pickFileFromGallery(widget.thumbnail, FileType.video);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                  width: 21,
                  child: Image.asset(
                    "images/video.png",
                  ),
                ),
                Text(
                  "Add Videos",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: descriptionText_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            //  150,
          ),
        ));
  }

/*   addvideo() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickVideo(source: ImageSource.gallery);

    if (result != null) {
      controller.file = File(result.path);
      controller.imagevideo(FilepickerType(type: "video", url: result.path));
    } else {
      return null;
    }
  }
 */

}
