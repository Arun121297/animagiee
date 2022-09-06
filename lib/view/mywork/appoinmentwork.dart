import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class List_Of_Appoinment_UI extends StatefulWidget {
  const List_Of_Appoinment_UI({Key? key}) : super(key: key);

  @override
  State<List_Of_Appoinment_UI> createState() => _List_Of_Appoinment_UIState();
}

class _List_Of_Appoinment_UIState extends State<List_Of_Appoinment_UI> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 10.0.hp,
        //  79,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 44,
              width: 60,
              child: Image.asset(
                "images/profilecart.png",
                // cacheHeight: 44,
                // cacheWidth: 60,
              ),
            ),
            Text("Total appointments"),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              endIndent: 5,
              indent: 5,
            ),
            Text("34")
          ],
        ),
      ),
    );
  }
}
