import 'package:animagieeui/chat/group_chat/chat_provider.dart';
import 'package:animagieeui/chat/single_chat/chat_provider.dart';
import 'package:animagieeui/view/homepage/widgets/dynamic_link_service_new.dart';
import 'package:animagieeui/view/splashscreen/splashscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/check_login.dart';
import 'config/firebase_token.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = await CheckLogin().checkLogin();
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp(
    prefs: prefs,
  ));
}

late String? token;

class MyApp extends StatefulWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final SharedPreferences prefs;
  MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseToken.createToken();
    DynamicLinkServiceNew().retrieveDynamicLink(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (ctx) => AuthenticationProvider(FirebaseAuth.instance),
        // ),
        // StreamProvider(
        //   create: (BuildContext context) {
        //     return context.read<AuthenticationProvider>().authStateChanges;
        //   },
        //   initialData: null,
        // ),
        Provider<GroupChatProvider>(
          create: (_) => GroupChatProvider(
            firebaseFirestore: widget.firebaseFirestore,
            prefs: widget.prefs,
            firebaseStorage: widget.firebaseStorage,
          ),
        ),
        Provider<ChatProvider>(
          create: (_) => ChatProvider(
            firebaseFirestore: widget.firebaseFirestore,
            prefs: widget.prefs,
            firebaseStorage: widget.firebaseStorage,
          ),
        ),
      ],
      child: GetMaterialApp(
        title: 'ash Screen',
        // theme: ThemeData(primarySwatch: Colors.),
        home: Splash_Screen(
          token: token,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
