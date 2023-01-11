import 'package:animagieeui/config/colorconfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupHelper extends StatefulWidget {
  PopupHelper(
      {Key? key,
      required this.title,
      required this.noOnTap,
      required this.yesOnTap,
      required this.yesButtonTitle})
      : super(key: key);
  String? title;
  VoidCallback? noOnTap;
  VoidCallback? yesOnTap;
  String? yesButtonTitle;

  @override
  State<PopupHelper> createState() => _PopupHelperState();
}

class _PopupHelperState extends State<PopupHelper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(
          widget.title ?? "",
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.019,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
              boxShadow: kElevationToShadow[0], color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.053,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFFFA800),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                    onPressed: widget.noOnTap,
                    // elevation: 0,
                    // color: Colors.white,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        textStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                color: animagiee_CL,
                                fontWeight: FontWeight.w600))),

                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Cancel",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: animagiee_CL,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.053,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: animagiee_CL,
                      borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                    onPressed: widget.yesOnTap,
                    // elevation: 2,
                    // color: const Color(0xFFFFA800),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0)),
                    // padding: const EdgeInsets.all(0.0),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: animagiee_CL,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        textStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))),

                    child: Container(
                      alignment: Alignment.center,
                      child: Text(widget.yesButtonTitle ?? "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

void helperPopup(
    {required context,
    required title,
    required noOnTap,
    required yesOnTap,
    required yesButtonTitle}) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 16,
            child: PopupHelper(
                title: title,
                noOnTap: noOnTap,
                yesOnTap: yesOnTap,
                yesButtonTitle: yesButtonTitle));
      });
    },
  );
}
