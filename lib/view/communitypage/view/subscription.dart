// import 'dart:developer';

// import 'package:animagieeui/config/extension.dart';
// import 'package:animagieeui/view/instancepage/controller/instancecontroller.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../../controller/controller.dart';
// import '../../instancepage/controller/updateinstancecontroller.dart';
// // import '../controller/updateinstancecontroller.dart';

// class Communitieslist extends StatefulWidget {
//   const Communitieslist({Key? key}) : super(key: key);

//   @override
//   State<Communitieslist> createState() => _CommunitieslistState();
// }

// class _CommunitieslistState extends State<Communitieslist> {
//   Controller controller = Get.put(Controller());
//   InstanceContoroller instanceContoroller = Get.put(InstanceContoroller());
//   UpdataInstanceController updataInstanceController =
//       Get.put(UpdataInstanceController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 35.0.hp,
//       // 260,
//       width: 90.0.wp,
//       //  337,
//       child: GridView.builder(
//           itemCount: instanceContoroller.getinstancedata[0].data!.length,
//           // Catagaries.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 1.1.sp,
//             crossAxisCount: 3,
//             crossAxisSpacing: 4,
//             mainAxisSpacing: 3.6.sp,
//           ),
//           itemBuilder: (context, index) {
//             var data = instanceContoroller.getinstancedata[0].data;
//             return Stack(children: [
//               GestureDetector(
//                 onTap: () {
//                   // print(CataName[index]);
//                   setState(() {
//                     var i = index;
//                     controller.data[i] == false
//                         ? controller.data[i] = true
//                         : controller.data[i] = false;
//                     print(controller.data[i]);

//                     if (instanceContoroller.communitylist
//                         .contains(data![i].id.toString())) {
//                       instanceContoroller.communitylist
//                           .removeWhere((element) => element == (data[i].id));
//                       instanceContoroller.communitylistimage.removeWhere(
//                           (element) => element == (data[i].imageUrl));
//                       instanceContoroller.communitiesname.removeWhere(
//                           (element) => element == (data[i].communityName));
//                     } else {
//                       instanceContoroller.communitylist.add(data[i].id!);
//                       instanceContoroller.communitylistimage
//                           .add(data[index].imageUrl);
//                       instanceContoroller.communitiesname
//                           .add((data[i].communityName));
//                     }
//                     log("communitylist${instanceContoroller.communitylist}");
//                     log("communitylistimage${instanceContoroller.communitylistimage}");
//                     log("communitiesname${instanceContoroller.communitiesname}");
//                   });
//                 },
//                 child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           data![index].imageUrl.toString(),
//                         ),
//                         colorFilter:
//                             ColorFilter.mode(Colors.black38, BlendMode.darken),
//                       ),
//                       borderRadius: BorderRadius.circular(15.0.sp),
//                     ),
//                     child: SizedBox(
//                       width: 18.2.wp,
//                       // 65,
//                       child: Text(
//                         '${data[index].communityName}',
//                         maxLines: 2,
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                             fontSize: 10.0.sp,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     )),
//               ),
//               Visibility(
//                 visible: instanceContoroller.communitylist
//                         .contains(data[index].id.toString())
//                     ? true
//                     : false,
//                 // controller.data[index],
//                 child: SizedBox(
//                   height: 3.0.hp,
//                   // 20,
//                   width: 6.0.wp,
//                   //  20,
//                   child: Image.asset("images/success1.png"),
//                 ),
//               )
//             ]);
//           }),
//     );
//   }
// }
