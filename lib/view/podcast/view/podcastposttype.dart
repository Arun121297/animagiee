import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

enum BestTutorSite_pod { Individual, Group }

class Podcast_Post_Method_UI extends StatefulWidget {
  const Podcast_Post_Method_UI({Key? key}) : super(key: key);

  @override
  State<Podcast_Post_Method_UI> createState() => _Podcast_Post_Method_UIState();
}

class _Podcast_Post_Method_UIState extends State<Podcast_Post_Method_UI> {
  Controller controller = Get.put(Controller());

  BestTutorSite_pod site = BestTutorSite_pod.Individual;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.person,
                    color: animagiee_CL,
                  ),
                  Text(
                    "Individual",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: descriptionText_CL,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Radio(
                    value: BestTutorSite_pod.Individual,
                    groupValue: site,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black), //<-- SEE HERE
                    onChanged: (value) {
                      setState(() {
                        controller.podcastposttype_bool.value = true;
                        site = BestTutorSite_pod.Individual;
                        ;
                      });
                    },
                  ),
                ],
              ),
              height: 6.0.hp,
              //  45,
              width: 45.0.wp,
              //  150,
            )),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 3.0.hp,
                    //  19,
                    width: 8.0.wp,
                    //  19,
                    child: Image.asset("images/grouppost.png"),
                  ),
                  // Icon(
                  //   Icons.group,
                  //   color: animagiee_CL,
                  // ),
                  Text(
                    "Group",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 9.0.sp,
                        color: descriptionText_CL,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Radio(
                    value: BestTutorSite_pod.Group,
                    groupValue: site,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black), //<-- SEE HERE
                    onChanged: (value) {
                      setState(() {
                        controller.podcastposttype_bool.value = false;
                        site = BestTutorSite_pod.Group;
                        ;
                      });
                    },
                  ),
                  // Radio(
                  //     value: BestTutorSite.Group,
                  //     groupValue: site,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         site = BestTutorSite.Group;
                  //       });
                  //       print(value); //selected value
                  //     })
                ],
              ),
              height: 6.0.hp,
              //  45,
              width: 45.0.wp,
              //  150,
            ))
      ],
    );
  }
}
