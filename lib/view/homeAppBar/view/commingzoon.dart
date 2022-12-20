import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommingZoon extends StatelessWidget {
  const CommingZoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 310,
        height: 207,
        child: Image.asset('images/commingsoon.png'),
      ),
    );
  }
}
