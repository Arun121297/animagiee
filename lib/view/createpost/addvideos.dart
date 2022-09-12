import 'dart:io';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/colorconfig.dart';

class Add_Video_UI extends StatefulWidget {
  const Add_Video_UI({Key? key}) : super(key: key);

  @override
  State<Add_Video_UI> createState() => _Add_Video_UIState();
}

class _Add_Video_UIState extends State<Add_Video_UI> {
  Controller controller = Get.put(Controller());
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
                    // cacheHeight: 20,
                    // cacheWidth: 21,
                  ),
                ),
                // Icon(
                //   Icons.video_stable,
                //   color: animagiee_CL,
                // ),
                Text("Videos"),
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
      controller.file = File(result.path);
      controller.imagevideo(FilepickerType(type: "video", url: result.path));
    } else {
      return null;
    }
  }
  // addvideo() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.video);

  //   if (result != null) {
  //     PlatformFile file = result.files.first;
  //     print(file.name);
  //     print(file.bytes);
  //     print(file.size);
  //     print(file.extension);
  //     print(file.path);
  //   } else {
  //     // User canceled the picker
  //   }
  //   // print("sdfsdf");
  //   // filepicker();}
  // }
}
