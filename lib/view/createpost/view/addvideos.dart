import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:animagieeui/view/instancepage/controller/post_creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/colorconfig.dart';

class Add_Video_UI extends StatefulWidget {
  const Add_Video_UI({Key? key}) : super(key: key);

  @override
  State<Add_Video_UI> createState() => _Add_Video_UIState();
}

class _Add_Video_UIState extends State<Add_Video_UI> {
  final controller1 = Get.find<PostCreatioController>();
  // Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() async {
              addvideo();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            //  150,
          ),
        ));
  }

  addvideo() async {
    final ImagePicker imagePicker = ImagePicker();

    final result = await imagePicker.pickVideo(source: ImageSource.gallery);

    if (result != null) {
      controller1.file = File(result.path);
      controller1.imagevideo(FilepickerType1(type: "video", url: result.path));
    } else {
      return null;
    }
  }
}
