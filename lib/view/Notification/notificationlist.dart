import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_content_List extends StatefulWidget {
  const Notification_content_List({Key? key}) : super(key: key);

  @override
  State<Notification_content_List> createState() =>
      _Notification_content_ListState();
}

class _Notification_content_ListState extends State<Notification_content_List> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: ExactAssetImage("images/myprofilebg.jpg"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommended for you",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 50.0.wp,
                    // 200,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and ...",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 7.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    if (controller.isvisible == false.obs) {
                      controller.isvisible = true.obs;
                    } else {
                      controller.isvisible = false.obs;
                    }
                  });
                },
              ),
            ],
          ),
          Divider(
            endIndent: 20,
            indent: 20,
            color: Colors.grey,
            thickness: 1,
          )
        ],
      ),
      Visibility(
        visible: controller.isvisible.value,
        child: Positioned(
          right: 50.0.sp,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 30.0.wp,
              // 113,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  height: 8.0.hp,
                  //  58,
                  width: 113,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1.5),
                      borderRadius: BorderRadius.circular(5)),
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          // print(popup);
                        },
                        child: Text(
                          "  Delete",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 8.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 10,
                        // indent: 5,
                        color: Colors.grey.shade200,
                        thickness: 1,
                      ),
                      Text(
                        "  Mute Notifcations",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 8.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
