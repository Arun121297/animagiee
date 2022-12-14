import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../config/colorconfig.dart';
import '../../controller/controller.dart';
import '../intrestpage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var fbuserEmail;
  var username = '';

  var username1 = '';

  var username2 = '';

  var username3 = '';

  var username4 = '';

  var username5 = '';

  var username6 = '';
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0.hp,
              //  280,
              child: Image.asset("images/Good_doggy.gif"),
            ),
            SizedBox(
              height: 10.0.hp,
              //  60,
            ),
            Text(
              "Hello !!!",
              style: GoogleFonts.jost(
                textStyle: TextStyle(
                  fontSize: 26.5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Welcome to Animagie the best place to share the love ",
              style: GoogleFonts.poppins(
                color: WelcomeContent_Cl,
                textStyle: TextStyle(
                  fontSize: 9.5.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "about your pets... ",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: WelcomeContent_Cl,
                  fontSize: 9.5.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 9.0.hp,
              //  75,
            ),
            // SizedBox(child: Text("Email--->${username3}/Fb--->${fbuserEmail}")),

            ///login through FaceBook

            GestureDetector(
              onTap: () {
                // signInWithFacebook();

                setState(() {});
              }, // {

              // Get.to(
              //   () => Welcome_Page(),
              // );
              // },
              child: Container(
                height: 6.0.hp,
                // 47,
                width: 90.0.wp,
                // 308,
                decoration: BoxDecoration(
                  color: SigninButton_CL,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4.0.wp,
                    ),
                    Icon(
                      Icons.facebook,
                      color: FB_CL,
                      size: 40,
                    ),
                    // SizedBox(
                    //   width: 9.0.wp,
                    // ),
                    Expanded(child: SizedBox()),
                    Text(
                      "Continue with facebook",
                      style: GoogleFonts.poppins(
                        color: SigninBtn_Content_CL,
                        textStyle: TextStyle(
                          fontSize: 9.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0.hp,
                      // 28,
                    ),
                    Expanded(child: SizedBox())
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.0.hp,
              // 28,
            ),

            ///login through Google
            ElevatedButton(
                onPressed: () async {
                  await Firebase.initializeApp();
                  await GoogleSignIn().signOut();
                  await FacebookAuth.instance.logOut();
                },
                child: const Text("flogout")),
            GestureDetector(
              onTap: () {
                signInWithGoogle();

                setState(() {});
              },
              // {
              // Get.to(
              //   () => Welcome_Page(),
              // );
              // },
              child: Container(
                  decoration: BoxDecoration(
                    color: SigninButton_CL,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 6.0.hp,
                  // 47,
                  width: 90.0.wp,
                  // 308,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 3.3.wp,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        // backgroundImage: ExactAssetImage('images/Google__G__Logo.svg.webp'),
                        child:
                            Image.asset('images/GGogle.png', fit: BoxFit.cover),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Continue with Google",
                        style: GoogleFonts.poppins(
                          color: SigninBtn_Content_CL,
                          textStyle: TextStyle(
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.0.hp,
                        // 28,
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    log('try-1');
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);
    log('try-2');

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    log('try-3');

    final userdata = await FacebookAuth.instance.getUserData();
    controller.Fbemail.value = userdata['email'];
    log("fbname-->${controller.Fbemail.value}");
    // Get.to(
    //   () => Welcome_Page(),
    // );
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

/////////////////////////////////////////////////////////////////
  ///
  ///
  ///
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    username = googleUser!.id.toString();
    username1 = googleUser.displayName.toString();
    username2 = googleUser.serverAuthCode.toString();
    controller.email.value = googleUser.email.toString();
    username4 = googleUser.photoUrl.toString();
    username5 = googleUser.authHeaders.toString();
    username6 = googleUser.authentication.asStream().toString();
    Get.to(
      () => Welcome_Page(),
    );
    log("id-->$username");
    log("displayname-->$username1");
    log("serverAuthCode-->$username2");
    log("email--->${controller.email.value}");
    log("photoUrl-->$username4");
    log("authHeaders-->$username5");
    log("authentication-->$username6");

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
