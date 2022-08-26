import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';

class MY_Profile_Header_UI extends StatefulWidget {
  const MY_Profile_Header_UI({Key? key}) : super(key: key);

  @override
  State<MY_Profile_Header_UI> createState() => _MY_Profile_Header_UIState();
}

class _MY_Profile_Header_UIState extends State<MY_Profile_Header_UI> {
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          // color: Colors.black,
          height: 17.0.hp,
          //  168,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/myprofilebg.jpg"),
                      fit: BoxFit.cover),
                  color: animagiee_CL,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              width: MediaQuery.of(context).size.width,
              height: 10.0.hp,
              // 108,
              // child: Image.asset("images/Dogs.jpg", fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20),
              child: Align(
                heightFactor: 1.4,
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 42.0.sp,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundImage: ExactAssetImage("images/myprofile.jpg"),
                    // backgroundColor: animagiee_CL,
                    radius: 40.0.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                  padding: EdgeInsets.only(left: 40),
                  margin: EdgeInsets.only(left: 53),
                  child: Text(
                    "MY Profile",
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ),
          ]),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur.",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 11,
                color: dummycontent_Cl,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 4.0.hp,
              // 30,
              width: 33.0.wp,
              // 124,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: animagiee_CL,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Followers"),
                  VerticalDivider(
                    color: animagiee_CL,
                  ),
                  Text("95")
                ],
              ),
            ),
            Container(
              height: 4.0.hp,
              // 30,
              width: 33.0.wp,
              // 124,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: animagiee_CL,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("following"),
                  VerticalDivider(
                    color: animagiee_CL,
                  ),
                  Text("195")
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 31,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: animagiee_CL,
                ),
              ),
              child: Icon(Icons.settings),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 3,
                child: SizedBox(
                    width: 160,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: animagiee_CL,
                        ),
                        Text("Post"),
                        VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                          color: Colors.grey,
                          thickness: 1,
                          width: 2,
                        ),
                        Text("34")
                      ],
                    )),
              ),
              Card(
                elevation: 3,
                child: SizedBox(
                    width: 178,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.group,
                          color: animagiee_CL,
                        ),
                        Text("Community"),
                        VerticalDivider(
                          endIndent: 5,
                          indent: 5,
                          color: Colors.grey,
                          thickness: 1,
                          width: 2,
                        ),
                        Text("15")
                      ],
                    )),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 46,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("My Favourites"),
                    Icon(
                      Icons.bookmark,
                      color: animagiee_CL,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: boxcolor_CL,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 46,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text("Appointment Details"),
                    // Flexible(child: SizedBox()),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "images/profilecart.png",
                      cacheHeight: 12,
                      width: 17,
                    ),
                    VerticalDivider()
                  ],
                ),
                decoration: BoxDecoration(
                    color: boxcolor_CL,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 46,
                width: 330,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Settings"),
                    Icon(
                      Icons.settings,
                      color: animagiee_CL,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: boxcolor_CL,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 46,
                width: 330,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Logout"),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Icon(
                      Icons.logout,
                      color: animagiee_CL,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: boxcolor_CL,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey)),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
