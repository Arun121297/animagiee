import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/chats/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

class Create_New_Group_UI extends StatefulWidget {
  const Create_New_Group_UI({Key? key}) : super(key: key);

  @override
  State<Create_New_Group_UI> createState() => _Create_New_Group_UIState();
}

class _Create_New_Group_UIState extends State<Create_New_Group_UI> {
  Controller controller = Get.put(Controller());
  bool valuebol = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.chatapp("New Group", context),
              SizedBox(
                height: 26,
              ),
              Align(alignment: Alignment.center, child: chat_Search_UI()),
              SizedBox(
                height: 32,
              ),
              Container(
                // alignment: Alignment.center,
                // color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 17,
                    ),
                    Container(
                      width: 260,
                      child: TextField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Group name',
                            labelStyle: TextStyle(
                                color: content1_CL,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 37,
              // ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Suggested",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 13.0.sp,
                      color: animagiee_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Divider(),
              SizedBox(
                height: 360,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: SizedBox(
                        height: 56,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Daniel Smith",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 10.0.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Pet lover",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 9.0.sp,
                                        color: content1_CL,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Checkbox(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return animagiee_CL.withOpacity(.32);
                                }
                                return animagiee_CL;
                              }),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: valuebol,
                              onChanged: (value) {
                                setState(() {
                                  valuebol = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    // Get.to(MyClubs_UI());
                  },
                  child: Container(
                    height: 6.0.hp,
                    // 43,
                    width: 90.0.wp,
                    // 310,
                    decoration: BoxDecoration(
                        color: buttonColor1_CL,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Text(
                      "Add to Group",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 17.0.sp,
                          color: SigninButton_CL,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
