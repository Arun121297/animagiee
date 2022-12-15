import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';

class Doctor_Profile_Image_UI extends StatelessWidget {
  Doctor_Profile_Image_UI({Key? key, this.fetchindex}) : super(key: key);
  var fetchindex;
  List doctorimage = [
    "images/doc_1.jpg",
    "images/doc_2.jpg",
    "images/doc_3.jpg",
    "images/doc_4.jpg",
    "images/doc_5.jpg",
    "images/doc_1.jpg",
    "images/doc_2.jpg",
    "images/doc_3.jpg",
    "images/doc_4.jpg",
    "images/doc_5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 13.0.hp,
        // 100,
        width: 20.0.wp,
        // 70,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(doctorimage[fetchindex])),
        ));
  }
}
