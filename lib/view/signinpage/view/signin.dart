import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/signinpage/controller/signincontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/colorconfig.dart';
import '../../../controller/controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SigninController signinController = Get.put(SigninController());
  var fbuserEmail;
  var fbusername;
  var fbbd;
  var username = '';

  var username1 = '';

  var username2 = '';

  var username3 = '';

  var username4 = '';

  var username5 = '';

  var username6 = '';
  Controller controller = Get.put(Controller());

//// TO Close the APP
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => showExitPopup(),
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
              const SizedBox(
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
                  signInWithFacebook();

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
                      const Icon(
                        Icons.facebook,
                        color: FB_CL,
                        size: 40,
                      ),
                      // SizedBox(
                      //   width: 9.0.wp,
                      // ),
                      const Expanded(child: SizedBox()),
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
                      const Expanded(child: SizedBox())
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
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.clear();

                    await Firebase.initializeApp();
                    await GoogleSignIn().signOut();
                    await FacebookAuth.instance.logOut();
                  },
                  child: const Text("logout")),
              GestureDetector(
                onTap: () {
                  signInWithGoogle();

                  setState(() {});

                  // {
                  //   Get.to(
                  //     () => Welcome_Page(),
                  //   );
                  // }
                },
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
                          // backgroundImage: ExactAssetImage('images/Google_G_Logo.svg.webp'),
                          child: Image.asset('images/GGogle.png',
                              fit: BoxFit.cover),
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
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    log(("login-->}"));
    final LoginResult loginResult = await FacebookAuth.instance.login();
    log(("login-->${loginResult.status}"));
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userdata = await FacebookAuth.instance.getUserData();

    // log("data-->${userdata}");
    // log("data-->${userdata['email']}");
    // // log("data-->${userdata['public_profile']}");
    // log("data-->${userdata['name']}");
    // log("data-->${userdata['id']}");
    // log("data-->${userdata['email']}");
    fbuserEmail = userdata['email'];
    fbusername = userdata['name'];
    // fbbd = userdata['openid'];
    signinController.signinfunction(fbuserEmail, fbusername);

    // log("usaerdata-->$userdata");
    // log("fbname-->$fbuserEmail");
    // log("name-->$fbusername");
    // log("fbbd-->$fbbd");
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  // Future<UserCredential> signInWithFacebook() async {
  //   log('try-1');
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult =
  //       await FacebookAuth.instance.login(permissions: ['email', 'name', 'id']);
  //   log('try-2');

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   log('try-3');

  //   final userdata = await FacebookAuth.instance.getUserData();
  //   fbuserEmail = userdata['email'];
  //   fbusername = userdata['name'];
  //   fbbd = userdata['id'];

  //   log("usaerdata-->$userdata");
  //   log("fbname-->$fbuserEmail");
  //   log("name-->$fbusername");
  //   log("fbbd-->$fbbd");
  //   // signinController.signinfunction(fbuserEmail, fbusername);

  //   // Get.to(
  //   //   () => Welcome_Page(),
  //   // );
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

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
    username3 = googleUser.email.toString();
    username4 = googleUser.photoUrl.toString();
    username5 = googleUser.authHeaders.toString();
    username6 = googleUser.authentication.asStream().toString();
    signinController.signinfunction(username3, username1);

    // Get.to(
    //   () => Welcome_Page(),
    // );
    log("id-->$username");
    log("displayname-->$username1");
    log("serverAuthCode-->$username2");
    log("email--->$username3");
    log("photoUrl-->$username4");
    log("authHeaders-->$username5");
    log("authentication-->$username6");

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
