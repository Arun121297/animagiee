import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Create_Post_UI extends StatefulWidget {
  const Create_Post_UI({Key? key}) : super(key: key);

  @override
  State<Create_Post_UI> createState() => _Create_Post_UIState();
}

class _Create_Post_UIState extends State<Create_Post_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: controller.posttype_bool.value,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          elevation: 3,
          child: Stack(children: [
            Container(
              height: 60,
              width: 339,
              // color: Colors.green,
              child: Row(children: [
                Container(
                  height: 45,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("images/profilephotos.jpg"),
                    ),
                  ),
                ),
                Text("Arun's Group"),
                Expanded(child: Container()),
                Icon(Icons.keyboard_arrow_down),
                SizedBox(
                  width: 12,
                )
              ]),

              // alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("images/Livestock.jpg"),
              //     colorFilter: ColorFilter.mode(
              //         Colors.black.withOpacity(0.7), BlendMode.darken),
              //   ),
              //   borderRadius: BorderRadius.circular(15),
              // ),
              // child: Text(
              //   "",
              //   style: GoogleFonts.poppins(
              //     textStyle: TextStyle(
              //       fontSize: 10.0.sp,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // )
              // height: 20,
              // width: 105,
            ),
            Obx(() {
              return Visibility(
                visible: controller.posttype_bool.value,
                child: Container(
                  height: 60,
                  width: 339,
                  color: Colors.black54,
                ),
              );
            })
          ]),
        ),
      ),
    );
  }
}