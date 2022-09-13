import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyStatus_UI extends StatefulWidget {
  const MyStatus_UI({Key? key}) : super(key: key);

  @override
  State<MyStatus_UI> createState() => _MyStatus_UIState();
}

class _MyStatus_UIState extends State<MyStatus_UI> {
  String dropdownValue = 'Active';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.sp),
      child: Card(
        child: SizedBox(
          height: 5.0.hp,
          // 35,
          width: 40.0.wp,
          //  150,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 16,
            style: const TextStyle(color: Color.fromRGBO(176, 176, 176, 1)),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>["Active", "De-Active"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
