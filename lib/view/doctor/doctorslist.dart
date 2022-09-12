import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/controller.dart';
import 'appoinmentavalable.dart';
import 'doctorprofilephoto.dart';
import 'dotordetails.dart';

class Doctors_List_UI extends StatefulWidget {
  const Doctors_List_UI({Key? key}) : super(key: key);

  @override
  State<Doctors_List_UI> createState() => _Doctors_List_UIState();
}

class _Doctors_List_UIState extends State<Doctors_List_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            controller.clubapp("Doctor", Home_Page(), context),
            SizedBox(
              height: 3.0.hp,
              //  31,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 189,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Stack(alignment: Alignment.center, children: [
                    Card(
                      child: Container(
                        height: 14.0.hp,
                        // 110,
                        width: 95.0.wp,
                        // 329,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Doctor_Profile_Image_UI(fetchindex: index),
                            SizedBox(
                              width: 12,
                            ),
                            Doctor_Details_UI(fetchindex: index),
                            Doctor_Appoinment_UI(
                              fetchindex: index,
                            )
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 3 ? true : false,
                      child: Container(
                        height: 14.0.hp,
                        // 110,
                        width: 95.0.wp,
                        // 329,
                        color: Colors.black54,
                      ),
                    )
                  ]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
