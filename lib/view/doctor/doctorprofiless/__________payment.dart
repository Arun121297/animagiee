// import 'package:animagieeui/config/colorconfig.dart';
// import 'package:animagieeui/config/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../controller/controller.dart';
// import 'doctorprofile.dart';
// import 'paymentsuccesspage.dart';

// class Doctor_Payment_UI extends StatefulWidget {
//   const Doctor_Payment_UI({Key? key}) : super(key: key);

//   @override
//   State<Doctor_Payment_UI> createState() => _Doctor_Payment_UIState();
// }

// class _Doctor_Payment_UIState extends State<Doctor_Payment_UI> {
//   Controller controller = Get.put(Controller());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//               icon: Container(
//                 height: 5.0.hp,
//                 //  40,
//                 width: 40.0.wp,
//                 // 148,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6.0.sp),
//                     border: Border.all(width: 2, color: Colors.black)),
//                 child: Text(
//                   "Back",
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 11.5.sp,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Container(
//                 height: 5.0.hp,
//                 //  40,
//                 width: 40.0.wp,
//                 // 148,
//                 decoration: BoxDecoration(
//                   color: animagiee_CL,
//                   borderRadius: BorderRadius.circular(6.0.sp),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   "Continue",
//                   style: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                       fontSize: 11.5.sp,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               label: "")
//         ],
//         onTap: (value) {
//           value == 1 ? Get.to(Successfull_Payment_UI()) : null;
//         },
//       ),
//       body: SafeArea(
//           child: Column(children: [
//         controller.clubapp("Payment", Doctor_Profile_UI(), context),
//         Container(
//           height: 25.0.hp,
//           //  172,
//           alignment: Alignment.center,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("SELECT A PAYMENT METHOD "),
//               SizedBox(
//                 height: 3.0.hp,
//                 //  20,
//               ),
//               // ListView.builder(
//               //   itemCount: 4,
//               //   itemBuilder: (context, index) {
//               //   return Card(
//               //       child: SizedBox(
//               //           height: 14.0.hp,
//               //           //  100,
//               //           width: 25.0.wp,
//               //           //  75,
//               //           child: Column(
//               //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               //             children: [
//               //               // ColorFiltered(
//               //               //   colorFilter: ColorFilter.mode(
//               //               //       Colors.blue, BlendMode.lighten),
//               //               // child:
//               //               Icon(
//               //                 Icons.credit_card_rounded,
//               //                 size: 40,
//               //                 color: Colors.blue,
//               //               ),
//               //               // Image.asset(
//               //               //   "images/card.png",
//               //               //   cacheHeight: 50,
//               //               //   cacheWidth: 50,
//               //               // ),
//               //               // ),
//               //               Text("Card")
//               //             ],
//               //           )),
//               //     );
//               // },)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Card(
//                     child: SizedBox(
//                         height: 14.0.hp,
//                         //  100,
//                         width: 20.0.wp,
//                         //  75,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             // ColorFiltered(
//                             //   colorFilter: ColorFilter.mode(
//                             //       Colors.blue, BlendMode.lighten),
//                             // child:
//                             Icon(
//                               Icons.credit_card_rounded,
//                               size: 40,
//                               color: Colors.blue,
//                             ),
//                             // Image.asset(
//                             //   "images/card.png",
//                             //   cacheHeight: 50,
//                             //   cacheWidth: 50,
//                             // ),
//                             // ),
//                             Text("Card")
//                           ],
//                         )),
//                   ),
//                   Card(
//                     child: SizedBox(
//                         height: 14.0.hp,
//                         //  100,
//                         width: 22.0.wp,
//                         //  75,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Icon(
//                               Icons.account_balance,
//                               size: 40,
//                               color: Colors.blue,
//                             ),
//                             // Image.asset(
//                             //   "images/netbanking.png",
//                             //   cacheHeight: 50,
//                             //   cacheWidth: 50,
//                             // ),
//                             Text("NetBanking")
//                           ],
//                         )),
//                   ),
//                   Card(
//                     child: SizedBox(
//                         height: 14.0.hp,
//                         //  100,
//                         width: 20.0.wp,
//                         //  75,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Icon(
//                               Icons.account_balance_wallet,
//                               size: 40,
//                               color: Colors.blue,
//                             ),
//                             // Image.asset(
//                             //   "images/wallet.png",
//                             //   cacheHeight: 50,
//                             //   cacheWidth: 50,
//                             // ),
//                             Text("Wallet")
//                           ],
//                         )),
//                   ),
//                   Card(
//                     child: SizedBox(
//                         height: 14.0.hp,
//                         //  100,
//                         width: 20.0.wp,
//                         //  75,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               height: 28,
//                               width: 50,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: Colors.blue, width: 2)),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "UPI",
//                                     style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   Image.asset(
//                                     "images/upiimage.png",
//                                     cacheHeight: 25,
//                                     cacheWidth: 20,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             // Image.asset(
//                             //   "images/upi",
//                             //   cacheHeight: 50,
//                             //   cacheWidth: 50,
//                             // ),
//                             Text("UPI")
//                           ],
//                         )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//         // Container(child: ,)
//       ])),
//     );
//   }
// }
