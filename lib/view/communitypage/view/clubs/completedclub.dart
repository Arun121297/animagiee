// import 'dart:io';

// import 'package:animagieeui/config/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../config/colorconfig.dart';
// import '../../../controller/controller.dart';
// import 'createnewclub.dart';
// import 'myclubs.dart';

// class Completed_Club_UI extends StatefulWidget {
//   const Completed_Club_UI({Key? key}) : super(key: key);

//   @override
//   State<Completed_Club_UI> createState() => _Completed_Club_UIState();
// }

// class _Completed_Club_UIState extends State<Completed_Club_UI> {
//   @override
//   void initState() {
//     controller.clubglobalprofileimage = controller.clubprofileimage;
//     controller.clubglobalbackgroundimage = controller.clubbackgroundimage;

//     // TODO: implement initState
//     super.initState();
//   }

//   Controller controller = Get.put(Controller());
//   String communitydropdownValue = 'Dog';
//   String communityTypedropdownValue = 'Private';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // bottomNavigationBar: Customized_Bottom_Bar(),
//       body: SafeArea(
//         child: Column(children: [
//           controller.clubapp("Create New Club", Create_New_Club_UI(), context),
//           SizedBox(
//             height: 20.0.hp,
//             // 150,
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       color: controller.clubglobalbackgroundimage.path.isEmpty
//                           ? animagiee_CL
//                           : Colors.transparent,
//                       image: DecorationImage(
//                           image: FileImage(
//                             controller.clubglobalbackgroundimage,
//                           ),
//                           fit: BoxFit.cover),
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(15),
//                           bottomRight: Radius.circular(15))),
//                   width: MediaQuery.of(context).size.width,
//                   height: 14.0.hp,

//                   //  108,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.black38,
//                       borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(15),
//                           bottomRight: Radius.circular(15))),
//                   width: MediaQuery.of(context).size.width,
//                   height: 14.0.hp,
//                   //  108,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.0),
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: CircleAvatar(
//                       radius: 65.0.sp,
//                       backgroundColor: Colors.white,
//                       child: controller.clubglobalprofileimage.path.isEmpty
//                           ? CircleAvatar(
//                               radius: 45.0.sp,
//                               backgroundColor: animagiee_CL,
//                               child: SizedBox(
//                                 height: 7.0.hp,
//                                 // 37,
//                                 width: 10.0.wp,
//                                 // 37,
//                                 child: Image.asset(
//                                   "images/clubcreateprofile.png",
//                                 ),
//                               ),
//                             )
//                           : CircleAvatar(
//                               radius: 45.0.sp,
//                               backgroundImage:
//                                   FileImage(controller.clubglobalprofileimage),
//                             ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: SizedBox(
//                         height: 6.0.hp,
//                         width: 9.0.wp,
//                         child: Image.asset("images/edit.png")),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0.0,
//                   left: 0.0,
//                   right: 0.0,
//                   top: 20.0.sp,
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 70.0.sp, left: 80.0.sp),
//                     child: Align(
//                         heightFactor: 5,
//                         alignment: Alignment.center,
//                         child: SizedBox(
//                             height: 6.0.hp,
//                             width: 9.0.wp,
//                             child: Image.asset("images/edit.png"))),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 3.0.hp,
//           ),
//           Container(
//             child: Text(
//               "Chennai Dogs FC",
//               style: GoogleFonts.poppins(
//                 textStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 10.0.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           Divider(
//             color: animagiee_CL,
//             endIndent: 130,
//             indent: 130,
//             thickness: 2,
//           ),
//           SizedBox(
//             height: 3.0.hp,
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 10.0.sp),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Club Name",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: club_Text_1,
//                         fontSize: 10.0.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                     elevation: 3,
//                     child: SizedBox(
//                         width: 90.0.wp,
//                         height: 5.0.hp,
//                         child: TextField(
//                             decoration: new InputDecoration(
//                           border: InputBorder.none,
//                         )))),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Club Description",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: club_Text_1,
//                         fontSize: 10.0.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                     elevation: 3,
//                     child: SizedBox(
//                         width: 90.0.wp,
//                         height: 5.0.hp,
//                         child: TextField(
//                             decoration: new InputDecoration(
//                           border: InputBorder.none,
//                         )))),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Community",
//                     style: GoogleFonts.poppins(
//                       textStyle: TextStyle(
//                         color: club_Text_1,
//                         fontSize: 10.0.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),

//                 ///dropdown
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 10.0.sp),
//                     width: 87.5.wp,
//                     // 320,
//                     height: 5.0.hp,
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: communitydropdownValue,
//                       icon: const Icon(Icons.keyboard_arrow_down),
//                       elevation: 16,
//                       style: const TextStyle(
//                           color: Color.fromRGBO(176, 176, 176, 1)),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.transparent,
//                       ),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           communitydropdownValue = newValue!;
//                         });
//                       },
//                       items: <String>['Dog', 'cat', 'birds', 'insects']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),

//                 ///
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Community Type",
//                         style: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                             color: club_Text_1,
//                             fontSize: 10.0.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 2,
//                       ),
//                       SizedBox(
//                         height: 2.0.hp,
//                         width: 4.0.wp,
//                         // 13,
//                         child: Image.asset(
//                           "images/about.png",
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Card(
//                   elevation: 3,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 10.0.sp),
//                     width: 87.0.wp, height: 5.0.hp,
//                     // width: 320,
//                     // height: 40,
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: communityTypedropdownValue,
//                       icon: const Icon(Icons.keyboard_arrow_down),
//                       elevation: 16,
//                       style: const TextStyle(
//                           color: Color.fromRGBO(176, 176, 176, 1)),
//                       underline: Container(
//                         height: 2,
//                         color: Colors.transparent,
//                       ),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           communityTypedropdownValue = newValue!;
//                         });
//                       },
//                       items: <String>['Private', 'Public']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 3.0.hp
//               //  40,
//               ),
//           controller.communityNext("Create", MyClubs_UI())
//         ]),
//       ),
//     );
//   }
// }
