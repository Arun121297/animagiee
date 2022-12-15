import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/view/chatscreen1.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/colorconfig.dart';
import '../../../../controller/controller.dart';

class GroupChat_AppBar_UI extends StatefulWidget {
  const GroupChat_AppBar_UI({Key? key}) : super(key: key);

  @override
  State<GroupChat_AppBar_UI> createState() => _GroupChat_AppBar_UIState();
}

class _GroupChat_AppBar_UIState extends State<GroupChat_AppBar_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          // Back_Button_UI(),
          // Chat_Screen_Back_Button(),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 12.0.sp,
            ),
            onPressed: () {
              Get.to(Chat_UI());
            },
          ),
          Expanded(child: Container()),
          // Expanded(child: SizedBox()),
          SizedBox(
            width: 4.0.wp,
            //  17,
          ),
          Row(
            children: [
              Container(
                width: 37.0.wp,
                // 129,
                // color: Colors.orange,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    right: 10.0.sp,
                    child: CircleAvatar(
                      radius: 11.0.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        backgroundImage:
                            ExactAssetImage("images/myprofilebg.jpg"),
                        radius: 10.0.sp,
                        // backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 28.0.sp,
                    child: CircleAvatar(
                      radius: 12.5.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 11.5.sp,
                        backgroundImage: ExactAssetImage("images/doc_3.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0.sp,
                    child: CircleAvatar(
                      radius: 11.0.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 10.0.sp,
                        backgroundImage:
                            ExactAssetImage("images/myprofilebg.jpg"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 26.0.sp,
                    child: CircleAvatar(
                      radius: 12.5.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 11.5.sp,
                        backgroundImage: ExactAssetImage("images/Dogs.jpg"),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 14.0.sp,
                    backgroundColor: animagiee_CL,
                    child: CircleAvatar(
                      radius: 13.0.sp,
                      backgroundImage: ExactAssetImage("images/doc_4.jpg"),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                width: 5.0.wp,
              ),
              // Text(""),
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              if (controller.chatoption.value == false) {
                controller.chatoption.value = true;
              } else {
                controller.chatoption.value = false;
              }
            },
            child: SizedBox(
              height: 2.0.hp,
              // 16,
              width: 5.0.wp,
              // 16,
              child: Image.asset(
                "images/burger.png",
              ),
            ),
          ),
          SizedBox(
            width: 4.0.wp,
          )
        ]),
      ),
    );
  }
}
