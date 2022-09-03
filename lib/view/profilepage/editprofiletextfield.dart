import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colorconfig.dart';

class Edit_Profile_TextField_UI extends StatefulWidget {
  const Edit_Profile_TextField_UI({Key? key}) : super(key: key);

  @override
  State<Edit_Profile_TextField_UI> createState() =>
      _Edit_Profile_TextField_UIState();
}

class _Edit_Profile_TextField_UIState extends State<Edit_Profile_TextField_UI> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:
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
            CircleAvatar(
              child: Image.asset(
                "images/editicon.png",
                cacheHeight: 14,
                cacheWidth: 14,
              ),
              radius: 13.0.sp,
              backgroundColor: Colors.white,
            ),
          ]),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            height: 13.0.hp,
            // 100,
            width: 89.0.wp, //  326,
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    hintText: "Lorem ipsum dolor sit amet, consectetur.")),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            //  43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "First Name",
              // hintText: "First Name"
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "Last Name",
              // hintText: "First Name"
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: DropdownButton(
              underline: SizedBox(), isExpanded: true,
              // Initial Value
              value: dropdownvalue,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                color: animagiee_CL, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Do you like to work with us",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.5.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    alignment: Alignment.center,
                    height: 3.5.hp,
                    // 29,
                    width: 20.0.wp,
                    // 64,
                    color: Colors.black,
                    child: Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    alignment: Alignment.center,
                    height: 3.5.hp,
                    // 29,
                    width: 20.0.wp,
                    // 64,
                    color: Colors.black,
                    child: Text(
                      "No",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    // margin: EdgeInsets.only(left: 18),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 6.0.hp,
                    //  43,
                    width: 45.0.wp,
                    // 156,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      underline: SizedBox(), isExpanded: true,
                      // Initial Value
                      value: dropdownvalue,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    // margin: EdgeInsets.only(left: 18),
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
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      labelStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      labelText: "DD/MM/YYYY",
                      // hintText: "First Name"
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "Email",
              // hintText: "First Name"
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
            // color: Colors.green,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Mobile Number",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "Mobile Number",
              // hintText: "First Name"
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "Address",
              // hintText: "First Name"
            )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    // margin: EdgeInsets.only(left: 18),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 6.0.hp,
                    //  43,
                    width: 45.0.wp,
                    // 156,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      underline: SizedBox(), isExpanded: true,
                      // Initial Value
                      value: dropdownvalue,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 18),
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
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 6.0.hp,
                    //  43,
                    width: 43.0.wp,
                    // 156,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      underline: SizedBox(), isExpanded: true,
                      // Initial Value
                      value: dropdownvalue,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: 18),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 6.0.hp,
            // 43,
            width: 89.0.wp,
            //  326,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              labelStyle: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              labelText: "Pin Code",
              // hintText: "First Name"
            )),
          ),
        ),
      ],
    );
  }
}
