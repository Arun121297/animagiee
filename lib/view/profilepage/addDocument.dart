import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'editprofilepage.dart';
import 'myprofile.dart';

class Add_Document_UI extends StatefulWidget {
  const Add_Document_UI({Key? key}) : super(key: key);

  @override
  State<Add_Document_UI> createState() => _Add_Document_UIState();
}

class _Add_Document_UIState extends State<Add_Document_UI> {
  var giflotti = "images/mpihZSqdsf.json";
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            controller.clubapp(
              "Document Required",
              Edit_Profile_UI(),
              context,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(18.0.sp),
                              child: Text(
                                "Document $index",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(18.0.sp),
                                child: Container(
                                  height: 4.5.hp,
                                  //  24,
                                  width: 26.0.wp,
                                  // 84,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(5.0.sp)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Add",
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: animagiee_CL,
                                            fontSize: 11.0.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.add_box_outlined,
                                        color: animagiee_CL,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 15.0.hp,
                          // 100,
                          width: 91.0.wp,
                          //  326,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 2),
                          ),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisExtent: 50,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2,
                                      crossAxisCount: 3),
                              itemCount: 5,
                              itemBuilder: (context, gridindex) => Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Stack(children: [
                                      Positioned(
                                        top: 5,
                                        child: Container(
                                          height: 3.8.hp,
                                          //  30,
                                          width: 22.0.wp,
                                          //  81,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              // color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.grey.shade300)),
                                          child: Text(
                                            "Doc.$gridindex",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: CircleAvatar(
                                          backgroundColor: animagiee_CL,
                                          child: Icon(
                                            Icons.close,
                                            size: 9.0.sp,
                                            color: Colors.white,
                                          ),
                                          radius: 6.0.sp,
                                        ),
                                      )
                                    ]),
                                  )),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                // Get.to(fun);
                Get.to(Edit_Profile_UI());
                // _showMyDialog(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                            // color: Colors.green,
                            height: 50.0.hp,
                            // 398.0,
                            width: 80.0.wp,
                            // 323.0,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 80.0.wp,
                                    //  323,
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () {
                                          // Get.to(My_Profile_UI());
                                          // controller.selectedIndex.value = 4;
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close_rounded))),
                                SizedBox(
                                    height: 30.0.hp,
                                    width: 60.0.wp,
                                    child: Lottie.asset(
                                      giflotti,
                                    )),
                                // Container(
                                //     height: 30.0.hp,
                                //     // 194,
                                //     width: 60.0.wp
                                //     // 194,
                                //     ),
                                Text(
                                  "Your Documents has been uploaded "
                                  "successfully...",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 11.0.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  "After the verification process your will be getting a notification"
                                  "from Animagie regarding the activation of your "
                                  "member profile.",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 8.0.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    //  errorDialog
                    );
              },
              child: Container(
                height: 6.0.hp,
                //  43,
                width: 90.0.wp,
                //  310,
                decoration: BoxDecoration(
                    color: buttonColor1_CL,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  "Upload Documents",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 14.0.sp,
                      color: SigninButton_CL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

// Controller controller = Get.put(Controller());
// Dialog errorDialog = Dialog(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12.0)), //this right here
//   child: Container(
//     // color: Colors.green,
//     height: 398.0,
//     width: 323.0,
//     child: Column(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//             width: 323,
//             alignment: Alignment.topRight,
//             child: IconButton(
//                 onPressed: () {
//                   // Get.to(My_Profile_UI());
//                   // controller.selectedIndex.value = 4;
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(Icons.close_rounded))),
//         Container(
//           height: 194,
//           width: 194,
//         ),
//         Text(
//           "Your Documents has been uploaded "
//           "successfully...",
//           maxLines: 2,
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             textStyle: TextStyle(
//               fontSize: 11.0.sp,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Text(
//           "After the verification process your will be getting a notification"
//           "from Animagie regarding the activation of your "
//           "member profile.",
//           maxLines: 2,
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(
//             textStyle: TextStyle(
//               fontSize: 8.0.sp,
//               color: Colors.grey,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );


// Future<void> _showMyDialog(context) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return Container(
//         height: 50,
//         width: 50,
//         color: Colors.amber,
//         child: AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('This is a demo alert dialog.'),
//                 Text('Would you like to approve of this message?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Approve'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
