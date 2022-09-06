import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Doctor_Profile_Image_UI extends StatefulWidget {
  var fetchindex;
  Doctor_Profile_Image_UI({Key? key, this.fetchindex}) : super(key: key);

  @override
  State<Doctor_Profile_Image_UI> createState() =>
      _Doctor_Profile_Image_UIState();
}

class _Doctor_Profile_Image_UIState extends State<Doctor_Profile_Image_UI> {
  List doctorimage = [
    "images/doc_1.jpg",
    "images/doc_2.jpg",
    "images/doc_3.jpg",
    "images/doc_4.jpg",
    "images/doc_5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 13.0.hp,
        // 100,
        width: 20.0.wp,
        // 70,
        // color: Colors.black,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(doctorimage[widget.fetchindex])),
        ));
  }
}
