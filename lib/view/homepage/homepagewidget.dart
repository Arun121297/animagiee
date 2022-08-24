import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'adminpost.dart';
import '../homeAppBar/appbar.dart';
import 'createpost.dart';

class Homepage_Wid extends StatefulWidget {
  const Homepage_Wid({Key? key}) : super(key: key);

  @override
  State<Homepage_Wid> createState() => _Homepage_WidState();
}

class _Homepage_WidState extends State<Homepage_Wid> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ///appbar
            AppbarContainer(),

            ///createpost
            CreatePost(),

            ////adminpost
            Admin_Post()
          ],
        ),
      ),
    );
  }
}
