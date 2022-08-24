import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../homeAppBar/backbutton.dart';

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
          Back_Button_UI(),
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
                    right: 10,
                    child: CircleAvatar(
                      radius: 11.0.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 10.0.sp,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 28,
                    child: CircleAvatar(
                      radius: 12.5.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 11.5.sp,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: CircleAvatar(
                      radius: 11.0.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 10.0.sp,
                        backgroundColor: Colors.purple,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child: CircleAvatar(
                      radius: 12.5.sp,
                      backgroundColor: animagiee_CL,
                      child: CircleAvatar(
                        radius: 11.5.sp,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: animagiee_CL,
                    child: CircleAvatar(radius: 16),
                  ),
                ]),
              ),
              SizedBox(
                width: 10,
              ),
              // Text(""),
            ],
          ),
          Expanded(child: Container()),
          IconButton(
              onPressed: () {
                if (controller.chatoption.value == false) {
                  controller.chatoption.value = true;
                } else {
                  controller.chatoption.value = false;
                }
              },
              icon: Icon(Icons.menu))
        ]),
      ),
    );
  }
}
