import 'package:flutter/material.dart';

import '../bottombarfile/bottomnavibar.dart';
import 'doctorslist.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Customized_Bottom_Bar(),
      body: Doctors_List_UI(),
    );
  }
}
