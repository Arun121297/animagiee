import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

enum BestTutorSite { Individual, Group }

class Post_Method_UI extends StatefulWidget {
  const Post_Method_UI({Key? key}) : super(key: key);

  @override
  State<Post_Method_UI> createState() => _Post_Method_UIState();
}

class _Post_Method_UIState extends State<Post_Method_UI> {
  Controller controller = Get.put(Controller());

  BestTutorSite site = BestTutorSite.Individual;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
            elevation: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.person,
                    color: animagiee_CL,
                  ),
                  Text("Individual"),
                  Radio(
                    value: BestTutorSite.Individual,
                    groupValue: site,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black), //<-- SEE HERE
                    onChanged: (value) {
                      setState(() {
                        controller.posttype_bool.value = true;
                        site = BestTutorSite.Individual;
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
        Material(
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
                  Text("Group"),
                  Radio(
                    value: BestTutorSite.Group,
                    groupValue: site,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black), //<-- SEE HERE
                    onChanged: (value) {
                      setState(() {
                        controller.posttype_bool.value = false;
                        site = BestTutorSite.Group;
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
