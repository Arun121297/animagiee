import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Doctor_Consulted_Pet_UI extends StatefulWidget {
  const Doctor_Consulted_Pet_UI({Key? key}) : super(key: key);

  @override
  State<Doctor_Consulted_Pet_UI> createState() =>
      _Doctor_Consulted_Pet_UIState();
}

class _Doctor_Consulted_Pet_UIState extends State<Doctor_Consulted_Pet_UI> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AlertDialog();
      },
      child: Container(
        height: 15.0.hp,
        //  63,
        width: 25.0.wp,
        //  63,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/Cats.jpg"))),
      ),
    );
  }

  AlertDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 23.0.hp, width: 70.0.wp,
              // alignment: Alignment.center,
              child: Image.asset(
                "images/Cats.jpg", fit: BoxFit.cover,
                // cacheHeight: 197,
                // cacheWidth: 246,
              ),
            ),
          ],
        );
      },
    );
  }
}
