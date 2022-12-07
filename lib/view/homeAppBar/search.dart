import 'package:animagieeui/controller/Appbar/appbarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search_UI extends StatefulWidget {
  const Search_UI({Key? key}) : super(key: key);

  @override
  State<Search_UI> createState() => _Search_UIState();
}

class _Search_UIState extends State<Search_UI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AppbarController appbarController = Get.put(AppbarController());

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // setState(() {
          //   if (appbarController.searchfield.value == true) {
          //     appbarController.searchfield.value = false;
          //   } else {
          //     appbarController.searchfield.value = true;
          //   }
          // });
        },
        icon: Icon(
          Icons.search,
          color: Colors.black,
        ));
  }
}
//SHA-256: E5:66:A7:F9:BA:0A:E6:18:74:67:9B:01:DF:C2:61:AF:EE:07:6B:0C:F9:DB:5B:34:BD:28:A6:86:6A:9A:EC:CD