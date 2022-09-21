// import 'package:animagieeui/config/colorconfig.dart';
// import 'package:animagieeui/config/extension.dart';
// import 'package:animagieeui/controller/controller.dart';

// import 'package:animagieeui/view/homeAppBar/notification.dart';
// import 'package:animagieeui/view/homeAppBar/search.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'editprofilepage.dart';

// class Profile_AppBar_UI extends StatefulWidget {
//   var title;
//   bool notification;
//   var navipage;
//   bool edit;
//   Profile_AppBar_UI(
//       {Key? key,
//       this.title,
//       required this.edit,
//       required this.notification,
//       this.navipage})
//       : super(key: key);

//   @override
//   State<Profile_AppBar_UI> createState() => _Profile_AppBar_UIState();
// }

// class _Profile_AppBar_UIState extends State<Profile_AppBar_UI> {
//   Controller controller = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 3,
//       child: SizedBox(
//         height: 7.0.hp,
//         width: MediaQuery.of(context).size.width,
//         child: Row(children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back_ios_new,
//               size: 12.0.sp,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               controller.selectedIndex.value = widget.navipage;
//             },
//           ),
//           Flexible(child: Container()),
//           SizedBox(
//             width: 10.0.wp,
//             //  45,
//           ),
//           Text(
//             widget.title,
//             style: GoogleFonts.poppins(
//               textStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 10.5.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Flexible(child: Container()),
//           Visibility(
//             visible: widget.notification,
//             child: Row(
//               children: [Search_UI(), Notification_UI()],
//             ),
//           ),
//           Visibility(
//             visible: widget.edit,
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(Edit_Profile_UI());
//               },
//               child: Container(
//                 height: 3.3.hp,
//                 //  20,
//                 width: 20.0.wp,
//                 // 70,
//                 decoration: BoxDecoration(
//                     color: animagiee_CL,
//                     borderRadius: BorderRadius.circular(20)),
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       "Edit",
//                       style: GoogleFonts.roboto(
//                         textStyle: TextStyle(
//                           color: Colors.black,
//                           fontSize: 9.0.sp,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5.0.hp,
//                       width: 3.0.wp,
//                       child: Image.asset(
//                         "images/editicon.png",
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 4.0.wp)
//         ]),
//       ),
//     );
//   }
// }
