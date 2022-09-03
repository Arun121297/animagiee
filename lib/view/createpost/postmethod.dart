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
        GestureDetector(
          onTap: () {
            setState(() {
              controller.posttype_bool.value = true;
            });
          },
          child: Material(
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
                        onChanged: (value) {
                          setState(() {
                            site = BestTutorSite.Individual;
                          });
                          print(value);
                        })
                  ],
                ),
                height: 45,
                width: 150,
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.posttype_bool.value = false;
            });
          },
          child: Material(
              elevation: 3,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.group,
                      color: animagiee_CL,
                    ),
                    Text("Group"),
                    Radio(
                        value: BestTutorSite.Group,
                        groupValue: site,
                        onChanged: (value) {
                          setState(() {
                            site = BestTutorSite.Group;
                          });
                          print(value); //selected value
                        })
                  ],
                ),
                height: 45,
                width: 150,
              )),
        )
      ],
    );
  }
}
