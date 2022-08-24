import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/bottombarfile/bottomnavibar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';
import '../../homepage/homepage.dart';
import 'createnewclub.dart';

class MyClubs_UI extends StatefulWidget {
  const MyClubs_UI({Key? key}) : super(key: key);

  @override
  State<MyClubs_UI> createState() => _MyClubs_UIState();
}

class _MyClubs_UIState extends State<MyClubs_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Customized_Bottom_Bar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // controller.cappbar("MyClub"),
            controller.cusapp("My Club", context),
            Container(
              height: 10.0.hp,
              // 87,
              // color: Colors.orange,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22.0),
                    child: CircleAvatar(
                      child: IconButton(
                          icon: Icon(
                            Icons.person_add,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Get.to(Create_New_Club_UI());
                          }),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Text(
                    "Create New Club",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12.0.sp,
                        color: dummycontent_Cl,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xffF1F1F1),
              height: 5.0.hp,
              //  35,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                "   My Subscriptions",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 11.0.sp,
                    color: dummycontent_Cl,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            controller.communitylist.isEmpty
                ? Align(
                    heightFactor: 30,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("No Datas"),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height - 290,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.communitylist.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: SizedBox(
                            height: 7.0.hp,
                            // 56,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                CircleAvatar(

                                    // IconButton(
                                    //     icon: Icon(
                                    //       Icons.person_add,
                                    //       color: Colors.black,
                                    //     ),
                                    //     onPressed: () {}),
                                    ),
                                SizedBox(
                                  width: 13,
                                ),
                                Text(controller.communitylist[index]),
                                Expanded(child: Container()),
                                GestureDetector(
                                  onTap: () {
                                    print(controller.communitylist.length);
                                  },
                                  child: Container(
                                    height: 3.5.hp,
                                    //  26,
                                    width: 24.0.wp,
                                    // 90,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: animagiee_CL,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Joined",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 9.0.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
