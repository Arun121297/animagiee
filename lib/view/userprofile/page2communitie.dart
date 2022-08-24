import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage_Communitie_Page2 extends StatefulWidget {
  const UserPage_Communitie_Page2({Key? key}) : super(key: key);

  @override
  State<UserPage_Communitie_Page2> createState() =>
      _UserPage_Communitie_Page2State();
}

class _UserPage_Communitie_Page2State extends State<UserPage_Communitie_Page2> {
  var sampleimage = "images/Cats.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage(sampleimage),
                ),
              ),
              Text("Cats"),
              Expanded(child: Container()),
              Container(
                height: 26,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: animagiee_CL),
                child: Text(
                  "Join",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 9.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
