import 'dart:async';

import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpTimer extends StatefulWidget {
  // var fetchtime;
  int currentSeconds = 0;
  OtpTimer({
    Key? key,
  });
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;
  // 900;

  String get timerText =>
      '${((timerMaxSeconds - widget.currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - widget.currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        widget.currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
      // fetchtime = int.parse(timerText);
    });
  }

  @override
  void initState() {
    startTimeout();
    // alert();
    // print(timerText == 890 ? "yes" : "NO");
    // timerText == 00 ? alert() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.timer,
          // color: timerText.toString() == 50 ? Colors.red : Colors.black,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          timerText,
          // style: TextStyle(color: timerText == 890 ? Colors.red : Colors.black),
        )
      ],
    );
  }

  alert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)), //this right here
              child: Container(
                // color: Colors.green,
                height: 398.0,
                width: 323.0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 323,
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              // Get.to(My_Profile_UI());
                              // controller.selectedIndex.value = 4;
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close_rounded))),
                    Container(
                      height: 194,
                      width: 194,
                    ),
                    Text(
                      "Your Documents has been uploaded "
                      "successfully...",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 11.0.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "After the verification process your will be getting a notification"
                      "from Animagie regarding the activation of your "
                      "member profile.",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 8.0.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        //  errorDialog
        );
  }
}
