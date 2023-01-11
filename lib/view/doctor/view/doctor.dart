import 'package:animagieeui/view/bottombarfile/view/bottomnavibar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../bottombarfile/view/bottomnavibar.dart';
import '../../../controller/controller.dart';
import 'doctorslist.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  Controller controller = Get.put(Controller());
  deviceback() {
    controller.selectedIndex.value = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   resizeToAvoidBottomInset: false,
        //   bottomNavigationBar: Customized_Bottom_Bar(),
        //   body:
        WillPopScope(
            onWillPop: () {
              return deviceback();
            },
            child: Doctors_List_UI());
    // );
  }
}
