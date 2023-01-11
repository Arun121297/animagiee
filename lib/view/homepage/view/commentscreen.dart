import 'package:animagieeui/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'commentlist.dart';

class CommentScreenDesign extends StatefulWidget {
  const CommentScreenDesign({super.key});

  @override
  State<CommentScreenDesign> createState() => _CommentScreenDesignState();
}

class _CommentScreenDesignState extends State<CommentScreenDesign> {
  back(context) {
    Get.back();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: TextFormField(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.black,
                  // size: 47,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        title: Text(
          "Comment",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 11.0.sp,
              color: Color(0xFF000000)),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => back(context),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Material(
              //   elevation: 3,
              //   child: Container(
              //       alignment: Alignment.center,
              //       height: 7.0.hp,
              //       width: MediaQuery.of(context).size.width,
              //       child: const Text("Comments")),
              // ),
              Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Text(
                  'All comments',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0.sp,
                      color: Color(0xFF333333)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 17.5.hp,
                //  80.0.hp,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return const CommentList();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
