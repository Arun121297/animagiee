import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import '../../../config/colorconfig.dart';

class Add_Photos_UI extends StatefulWidget {
  const Add_Photos_UI({Key? key}) : super(key: key);

  @override
  State<Add_Photos_UI> createState() => _Add_Photos_UIState();
}

class _Add_Photos_UIState extends State<Add_Photos_UI> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: GestureDetector(
          onTap: () {
            setState(() {
              filepicker();
            });
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
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
            height: 6.0.hp,
            //  45,
            width: 45.0.wp,
            //  150,
          ),
        ));
  }

  filepicker() async {
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
}
