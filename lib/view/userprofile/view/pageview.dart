// import 'package:animagieeui/config/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../config/colorconfig.dart';
// import '../../controller/controller.dart';
// import 'page1userpost.dart';
// import 'page2communitie.dart';

// class PageView_Content_UI extends StatefulWidget {
//   PageView_Content_UI({Key? key}) : super(key: key);

//   @override
//   State<PageView_Content_UI> createState() => _PageView_Content_UIState();
// }

// class _PageView_Content_UIState extends State<PageView_Content_UI> {
//   Controller controller = Get.put(Controller());

//   PageController pageController = PageController();

//   var pagechange;

//   @override
//   void initState() {
//     pagechange = 0;
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     pageController.animateToPage(
//                       0,
//                       duration: const Duration(milliseconds: 400),
//                       curve: Curves.easeInOut,
//                     );
//                   });
//                 },
//                 child: Text(
//                   "Post",
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.0.sp,
//                       color: dummycontent_Cl,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 )),
//             GestureDetector(
//                 onTap: () {
//                   pageController.animateToPage(
//                     1,
//                     duration: const Duration(milliseconds: 400),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 child: Text(
//                   "Communities",
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 10.0.sp,
//                       color: dummycontent_Cl,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           children: [
//             Container(
//                 height: pagechange == 0 ? 4 : 2,
//                 width: 50.0.wp,
//                 //  180,
//                 color: animagiee_CL),
//             Container(
//               height: pagechange == 1 ? 4 : 2,
//               width: 50.0.wp,
//               color: animagiee_CL,
//             ),
//           ],
//         ),
//         // Divider(color: animagiee_CL, thickness: 2),
//         SizedBox(
//           height: 2.0.hp,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height - 405,
//           child: PageView(
//             controller: pageController,
//             onPageChanged: (value) {
//               setState(() {
//                 pagechange = value;
//               });
//             },
//             children: [UserProfile_Page1_UI(), UserPage_Communitie_Page2()],
//           ),
//         )
//       ],
//     );
//   }
// }
