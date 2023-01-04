import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/profilepage/controller/editcontr/editController.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colorconfig.dart';

class Edit_Profile_TextField_UI extends StatefulWidget {
  const Edit_Profile_TextField_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_TextField_UI> createState() =>
      _Edit_Profile_TextField_UIState();
}

class _Edit_Profile_TextField_UIState extends State<Edit_Profile_TextField_UI> {
  EditScreenController editScreenController = Get.put(EditScreenController());
  var city = [
    'Nagercovil',
    'KKKKK',
    'NNNNNN',
    'PPPPPP',
    'OOOOOO',
  ];
  var profession = [
    'Veterinary Doctor',
    'Pet lover',
    'Breeder',
    'Trader',
    'Trainer',
    "Rescue worker",
  ];
  var state = [
    "TamilNadu",
    "k**********",
    'p*',
    "l**********",
  ];
  var gender = [
    'Male',
    'Female',
  ];
  var fixclr = Colors.grey;
  String professiondropvalue = 'Veterinary Doctor';
  String genderdropdownvalue = 'Male';
  String statedropdownvalue = 'TamilNadu';
  String citydropdownvalue = 'Nagercovil';
  bool workwithus = true;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              "Tell about yourself",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.0.sp,
                  color: dummycontent_Cl,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 13.0.wp,
              //  30,
            ),
            SizedBox(
                height: 6.0.hp,
                width: 9.0.wp,
                child: Image.asset("images/edit.png")),
          ]),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              height: 13.0.hp,
              // 100,
              width: 89.0.wp, //  326,

              child: Padding(
                padding: EdgeInsets.only(left: 8.0.sp),
                child: TextField(
                    controller: editScreenController.about,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.jost(
                          textStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        hintText: "Write something......")),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "First Name",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              //  43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 6.0.sp, right: 0.0),
                child: TextField(
                    controller: editScreenController.fname,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      hintText: "First Name",
                      // hintText: "First Name"
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Last Name",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 6.0.sp, right: 0.0),
                child: TextField(
                    controller: editScreenController.lname,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      hintText: "Last Name",
                      // hintText: "First Name"
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Profession",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,

              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child:

                  // dropdown
                  DropdownButton(
                selectedItemBuilder: (BuildContext context) {
                  //<-- SEE HERE
                  return profession.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            items,
                            style: const TextStyle(color: Colors.black),
                          )),
                    );
                  }).toList();
                },
                underline: const SizedBox(),
                isExpanded: true,
                dropdownColor: const Color.fromRGBO(237, 237, 237, 1),
                // Initial Value
                value: professiondropvalue,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.grey,
                    //  Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: profession.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              items,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: Colors.black,
                                  //  Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                        Divider(
                          height: 3.0.hp,
                          color: const Color.fromRGBO(181, 181, 181, 1),
                        )
                      ],
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    professiondropvalue = newValue!;
                  });
                },
              ),
              //
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Visibility(
            visible: workwithus,
            child: Column(
              children: const [
                // Card(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5.0.sp)),
                //   child: Container(
                //     height: 6.5.hp,
                //     // 43,
                //     width: 89.0.wp,
                //     //  326,
                //     decoration: BoxDecoration(
                //         border: Border.all(color: Colors.grey, width: 1),
                //         color: animagiee_CL,
                //         borderRadius: BorderRadius.circular(5.0.sp)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Text(
                //           "Do you like to work with us",
                //           style: GoogleFonts.poppins(
                //             textStyle: TextStyle(
                //               fontSize: 9.0.sp,
                //               color: Colors.black,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             setState(() {
                //               workwithus = false;
                //               Get.to(Add_Document_UI());
                //             });
                //           },
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5.0.sp)),
                //             child: Container(
                //               alignment: Alignment.center,
                //               height: 3.5.hp,
                //               // 29,
                //               width: 18.0.wp,
                //               // 64,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5.0.sp),
                //                 color: Colors.black,
                //               ),
                //               child: Text(
                //                 "Yes",
                //                 style: GoogleFonts.poppins(
                //                   textStyle: TextStyle(
                //                     fontSize: 9.0.sp,
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.w500,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //         Card(
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(5.0.sp)),
                //           child: Container(
                //             alignment: Alignment.center,
                //             height: 3.5.hp,
                //             // 29,
                //             width: 18.0.wp,
                //             // 64,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5.0.sp),
                //               color: Colors.black,
                //             ),
                //             child: Text(
                //               "No",
                //               style: GoogleFonts.poppins(
                //                 textStyle: TextStyle(
                //                   fontSize: 9.0.sp,
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 2.0.hp,
                // ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 4.0.sp),
                      // color: Colors.green,
                      // width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.sp)),
                    child: Container(
                      height: 6.0.hp,
                      //  43,
                      width: 43.0.wp,
                      // 156,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0.sp)),
                      child: DropdownButton(
                        hint: Center(
                          child: Text(
                            "Select Gender",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 9.5.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return gender.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    items,
                                    style: const TextStyle(color: Colors.black),
                                  )),
                            );
                          }).toList();
                        },
                        underline: const SizedBox(), isExpanded: true,
                        // Initial Value
                        value: editScreenController.gender.isEmpty
                            ? null
                            : editScreenController.gender.value,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: gender.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      items,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: Colors.black,
                                          //  Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )),
                                Divider(
                                  height: 3.0.hp,
                                  color: const Color.fromRGBO(181, 181, 181, 1),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          editScreenController.gender(newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 4.0.sp),
                      // color: Colors.green,
                      // width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Date of Birth",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 6.0.hp,
                      //  43,
                      width: 43.0.wp,
                      // 156,

                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0.sp)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0.sp, top: 0.0, bottom: 7.0.sp, right: 0.0),
                        child: TextField(
                            controller: editScreenController.dob,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                  fontSize: 9.5.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              hintText: "DD/MM/YYYY",
                              // hintText: "First Name"
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Email ID",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 7.0.sp, right: 0.0),
                child: TextField(
                    decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.jost(
                    textStyle: TextStyle(
                      fontSize: 9.5.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  hintText: "Email",
                  // hintText: "First Name"
                )),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Mobile Number",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 7.0.sp, right: 0.0),
                child: TextField(
                    controller: editScreenController.mNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      hintText: "Mobile Number",
                      // hintText: "First Name"
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Address",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 7.0.sp, right: 0.0),
                child: TextField(
                    controller: editScreenController.address,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // labelText: "  Address",
                        hintText: "Address")),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5.0.sp),
                      // color: Colors.green,
                      // width: MediaQuery.of(context).size.width,
                      child: Text(
                        "State",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.sp)),
                    child: Container(
                      height: 6.0.hp,
                      //  43,
                      width: 45.0.wp,
                      // 156,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0.sp)),
                      child: DropdownButton(
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return state.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    items,
                                    style: const TextStyle(color: Colors.grey),
                                  )),
                            );
                          }).toList();
                        },
                        underline: const SizedBox(), isExpanded: true,
                        // Initial Value
                        value: statedropdownvalue,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: state.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      items,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: Colors.black,
                                          //  Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )),
                                Divider(
                                  height: 3.0.hp,
                                  color: const Color.fromRGBO(181, 181, 181, 1),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            statedropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5.0.sp),
                      // color: Colors.green,
                      // width: MediaQuery.of(context).size.width,
                      child: Text(
                        "City",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.sp)),
                    child: Container(
                      height: 6.0.hp,
                      //  43,
                      width: 43.0.wp,
                      // 156,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0.sp)),
                      child: DropdownButton(
                        selectedItemBuilder: (BuildContext context) {
                          //<-- SEE HERE
                          return city.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    items,
                                    style: const TextStyle(color: Colors.grey),
                                  )),
                            );
                          }).toList();
                        },
                        underline: const SizedBox(), isExpanded: true,
                        // Initial Value
                        value: citydropdownvalue,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: city.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      items,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 9.5.sp,
                                          color: Colors.black,
                                          //  Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )),
                                Divider(
                                  height: 3.0.hp,
                                  color: const Color.fromRGBO(181, 181, 181, 1),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            citydropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.0.hp,
          ),
          Container(
              margin: EdgeInsets.only(left: 18.0.sp),
              // color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Pin Code",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 9.5.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0.sp)),
            child: Container(
              height: 6.0.hp,
              // 43,
              width: 89.0.wp,
              //  326,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0.sp)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 8.0.sp, top: 0.0, bottom: 6.5.sp, right: 0.0),
                child: TextField(
                    controller: editScreenController.pincode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.jost(
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // labelText: "  Pin Code",
                        hintText: "Pin Code")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
