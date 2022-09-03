import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';

import '../../config/colorconfig.dart';

// void main() => runApp(MyApp());

class Timer extends StatefulWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  var playpasslist = 0;
  @override
  void dispose() {
    play_Controller.dispose();
    super.dispose();
  }

  final CustomTimerController record_Controller = CustomTimerController();
  final CustomTimerController play_Controller = CustomTimerController();
  int min = 00;
  int sec = 00;
  int min_final = 00;
  int sec_final = 00;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Row(
                children: [
                  Visibility(
                    visible: playpasslist == 3 ? false : true,
                    child: CustomTimer(
                        controller: record_Controller,
                        begin: Duration(minutes: 0, seconds: 0),
                        end: Duration(minutes: 3, seconds: 0),
                        builder: (remaining) {
                          sec = int.parse(remaining.seconds);
                          min = int.parse(remaining.minutes);
                          sec_final = int.parse(remaining.seconds);
                          min_final = int.parse(remaining.minutes);

                          return Text(
                              "${remaining.minutes}:${remaining.seconds}",
                              style: TextStyle(fontSize: 24.0));
                        }),
                  ),
                  Visibility(
                    visible: playpasslist == 3 ? true : false,
                    child: CustomTimer(
                        controller: play_Controller,
                        begin: Duration(minutes: 00, seconds: 00),
                        end: Duration(minutes: min_final, seconds: sec_final),
                        builder: (remaining) {
                          return Text(
                              "${remaining.minutes}:${remaining.seconds}",
                              style: TextStyle(fontSize: 24.0));
                        }),
                  ),
                ],
              ),
            ),
            Text(
                playpasslist >= 2
                    ? "${min_final}:${sec_final}"
                    : "${min}:${sec}",
                style: TextStyle(fontSize: 24.0))
          ],
        ),
        SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              voicerecord();
              playrecordedvoice();
              increment();
            });
          },
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: animagiee_CL,
              child: playpasslist == 0
                  ? pause()
                  : playpasslist == 1
                      ? play()
                      : playpasslist == 2
                          ? run()
                          : playpasslist == 3
                              ? play()
                              : SizedBox(),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              play_Controller.reset();
              record_Controller.reset();
              resetvalue();
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 5.0.hp,
                //  25,
                width: 20.0.wp,
                // 69,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: animagiee_CL, width: 1)),
                child: Row(
                  children: [
                    Icon(Icons.refresh, color: animagiee_CL),
                    Text("re-take"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  voicerecord() {
    if (playpasslist == 0) {
      record_Controller.start();
    } else if (playpasslist == 1) {
      record_Controller.pause();
    }
  }

  playrecordedvoice() {
    if (playpasslist == 2) {
      print(sec);

      play_Controller.start();
    }
  }

  resetvalue() {
    min_final = 00;
    sec_final = 00;
    playpasslist = 0;
  }

  increment() {
    playpasslist = playpasslist + 1;
    if (playpasslist > 3) {
      playpasslist = 0;
    }
  }

  Widget pause() {
    return Image.asset(
      "images/mike.png",
      cacheHeight: 50,
      cacheWidth: 30,
    );
  }
}

Widget play() {
  return Image.asset(
    "images/pause.png",
    cacheHeight: 30,
    cacheWidth: 25,
  );
}

Widget run() {
  return Image.asset(
    "images/run.png",
    cacheHeight: 50,
    cacheWidth: 30,
  );
}

// class Timer extends StatefulWidget {
//   @override
//   _TimerState createState() => _TimerState();
// }

// class _TimerState extends State<Timer> {
//   final CustomTimerController _controller = CustomTimerController();
//   // bool passplay = false;
//   var playpasslist = 1;
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   var laps;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         CustomTimer(
//             controller: _controller,
//             begin: Duration(seconds: 00),
//             end: Duration(days: 1),
//             builder: (remaining) {
//               laps = remaining.seconds;
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text("00.00", style: TextStyle(fontSize: 24.0)),
//                   Text(
//                       // "${remaining.hours}:
//                       "${remaining.minutes}:${remaining.seconds}",
//                       // .${remaining.milliseconds}",
//                       style: TextStyle(fontSize: 24.0)),
//                 ],
//               );
//             }),
//         SizedBox(
//           height: 40,
//         ),
//         // SizedBox(height: 24.0),
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //   children: [
//         //     RoundedButton(
//         //       text: "Start",
//         //       color: Colors.green,
//         //       onPressed: () => _controller.start(),
//         //     ),
//         //     RoundedButton(
//         //       text: "Pause",
//         //       color: Colors.blue,
//         //       onPressed: () => _controller.pause(),
//         //     ),
//         //     RoundedButton(
//         //       text: "Reset",
//         //       color: Colors.red,
//         //       onPressed: () => _controller.reset(),
//         //     )
//         //   ],
//         // ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               // if (passplay == true) {
//               //   passplay = false;
//               // } else {
//               //   passplay = true;
//               // }

//               if (playpasslist == 1) {
//                 _controller.start();
//               } else if (playpasslist == 2) {
//                 _controller.pause();
//               } else {
//                 _controller.reset();
//               }
//               increment();
//               if (playpasslist == 3) {
//                 print(laps);
//               }
//             });
//           },
//           child: Align(
//             alignment: Alignment.center,
//             child: CircleAvatar(
//               radius: 50,
//               backgroundColor: animagiee_CL,
//               child: playpasslist == 1
//                   ? pause()
//                   : playpasslist == 2
//                       ? play()
//                       : playpasslist == 3
//                           ? run()
//                           : SizedBox(),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             _controller.reset();
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: Container(
//                 height: 25,
//                 width: 69,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(color: animagiee_CL, width: 1)),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.refresh,
//                       color: animagiee_CL,
//                     ),
//                     Text("re-take"),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   increment() {
//     playpasslist = playpasslist + 1;
//     if (playpasslist > 3) {
//       playpasslist = 1;
//     }
//   }

//   Widget pause() {
//     return Image.asset(
//       "images/mike.png",
//       cacheHeight: 50,
//       cacheWidth: 30,
//     );
//   }
// }

// Widget play() {
//   return Image.asset(
//     "images/pause.png",
//     cacheHeight: 30,
//     cacheWidth: 25,
//   );
// }

// Widget run() {
//   return Image.asset(
//     "images/run.png",
//     cacheHeight: 50,
//     cacheWidth: 30,
//   );
// }

// class RoundedButton extends StatelessWidget {
//   final String text;
//   final Color color;
//   final void Function()? onPressed;

//   RoundedButton({required this.text, required this.color, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       child: Text(text, style: TextStyle(color: Colors.white)),
//       style: TextButton.styleFrom(
//         backgroundColor: color,
//         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }
