import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Playing_Music_UI extends StatefulWidget {
  const Playing_Music_UI({Key? key}) : super(key: key);

  @override
  State<Playing_Music_UI> createState() => _Playing_Music_UIState();
}

class _Playing_Music_UIState extends State<Playing_Music_UI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.0.hp,
      // 52,
      color: animagiee_CL,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 6.0.wp,
            //  20,
          ),
          SizedBox(
            height: 41,
            width: 45,
            child: Image.asset(
              "images/musicpodcast.png",
              // cacheHeight: 41,
              // cacheWidth: 45,
            ),
          ),
          SizedBox(
            width: 6.0.wp,
            //  20,
          ),
          // Expanded(child: SizedBox()),
          Text(
            "Not playing",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 11.0.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: SizedBox()),

          SizedBox(
            width: 20.0.wp,
            //  80,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_arrow),
          ),
          IconButton(
            icon: Icon(Icons.autorenew),
            onPressed: () {},
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
