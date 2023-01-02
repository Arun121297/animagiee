import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';
import '../../../config/colorconfig.dart';

class AddPhotosUI extends StatefulWidget {
  AddPhotosUI({Key? key, required this.thumbnail}) : super(key: key);
  Function thumbnail;

  @override
  State<AddPhotosUI> createState() => _AddPhotosUIState();
}

class _AddPhotosUIState extends State<AddPhotosUI> {
  PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            controller.pickFileFromGallery(widget.thumbnail, FileType.image);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.camera_alt,
                  color: animagiee_CL,
                ),
                Text(
                  "Add Photo",
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

  /*  filepicker() async {
    final ImagePicker imagePicker = ImagePicker();
    final result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        controller.file = File(result.path);
        controller.imagevideo(FilepickerType(type: "image", url: result.path));
      });
    } else {
      return null;
    }
  }
 */
}
