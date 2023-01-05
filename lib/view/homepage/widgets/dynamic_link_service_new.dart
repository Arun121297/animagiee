import 'dart:developer';
import 'dart:io';
// import 'package:bemeli/config/constant.dart';
// import 'package:bemeli/views/home/initial.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../singlepost/view/singlepost.dart';

// import '../../views/user_profile_section/userprofile_view.dart';

class DynamicLinkServiceNew {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> retrieveDynamicLink(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // dynamicLinks.app.setAutomaticDataCollectionEnabled(enabled)

    try {
      final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.toString().contains('single')) {
          if (deepLink.queryParameters.containsKey('id')) {
            String? id = deepLink.queryParameters['id'];

            var post = id!.substring(0, id.length - 12);
            Get.to(SinglePostDesign(
              post: post,
            ));

            // Get.toNamed(, arguments: post);
          }
        } else if (deepLink.toString().contains('refer')) {
          if (deepLink.queryParameters.containsKey('id')) {
            String? id = deepLink.queryParameters['id'];
            var user = id!.substring(0, id.length - 7);

            // preferences.setBool(Constant.isAffiliateUser, true);
            // preferences.setString(Constant.ownerUserId, user);

            log('aff--->${user}');

            // Get.offAll(InitialScreen());
          }
        } else {
          if (deepLink.queryParameters.containsKey('id')) {
            String? id = deepLink.queryParameters['id'];

            // Get.to(() => UserProfileView(userId: id!, username: ''));
          }
        }
      }

      dynamicLinks.onLink.listen((PendingDynamicLinkData? event) async {
        if (event != null) {
          if (event.link.toString().contains('single')) {
            if (event.link.queryParameters.containsKey('id')) {
              String? id = event.link.queryParameters['id'];

              var post = id!.substring(0, id.length - 12);
              Get.to(SinglePostDesign(
                post: post,
              ));
              // Get.toNamed('/single_post', arguments: post);
            }
          } else if (event.link.toString().contains('refer')) {
            if (event.link.queryParameters.containsKey('id')) {
              String? id = event.link.queryParameters['id'];
              var user = id!.substring(0, id.length - 7);

              // preferences.setBool(Constant.isAffiliateUser, true);
              // preferences.setString(Constant.ownerUserId, user);

              // log('aff---->${preferences.getBool(Constant.isAffiliateUser)}/${preferences.getString(Constant.ownerUserId)}');

              // Get.offAll(InitialScreen());
            }
          } else {
            if (event.link.queryParameters.containsKey('id')) {
              String? id = event.link.queryParameters['id'];

              // Get.to(() => UserProfileView(
              //       userId: id!,
              //       username: '',
              //     ));
            }
          }
        }
      });
    } catch (e) {}
  }

  Future<Uri> generateFirebaseDynamicLink(DynamicLinkParameters params) async {
    final shortDynamicLink = await dynamicLinks.buildShortLink(params);
    return shortDynamicLink.shortUrl;
  }

  //   /// share product link that contains Dynamic link
  void shareProductLink(
      {required String postId,
      String postImage = '',
      String postTitle = '',
      String postDesc = '',
      bool postscreen = true,
      bool refer = false}) async {
    var productParams = createDynamicLink(
        postId: postId,
        postImage: postImage,
        postDesc: postDesc,
        postTitle: postTitle,
        refer: refer,
        singlePost: postscreen);
    var firebaseDynamicLink = await generateFirebaseDynamicLink(productParams);

    await Share.share(
        'BEMELI-Challenge for Betterment \n\nA positive social media to build an active online community which influences people to do various activities through challenges which encourages personal and social betterment\n\n$firebaseDynamicLink');
  }

  DynamicLinkParameters createDynamicLink(
      {String postId = '',
      String postImage = '',
      String postTitle = '',
      String postDesc = '',
      bool singlePost = true,
      bool refer = false}) {
    return DynamicLinkParameters(
        uriPrefix: 'https://animagieeui.page.link',
        link: singlePost == true
            ? refer == false
                ? Uri.parse('https://animagieeui.page.link?id=' +
                    postId +
                    '/?singlepost')
                : Uri.parse(
                    'https://animagieeui.page.link?id=' + postId + '/?refer')
            : Uri.parse('https://animagieeui.page.link?id=' + postId),
        androidParameters: AndroidParameters(
          packageName: 'com.example.animagieeui',
          minimumVersion: 1,
        ),
        // iosParameters: IOSParameters(
        //   bundleId: 'com.bemeli.iosapp',
        //   minimumVersion: "1",
        //   appStoreId: '1613706601',
        // ),
        socialMetaTagParameters: singlePost == true
            ? refer == false
                ? SocialMetaTagParameters(
                    imageUrl: Uri.parse(postImage),
                    title: postTitle,
                    description: postDesc)
                : SocialMetaTagParameters()
            : SocialMetaTagParameters(
                imageUrl: Uri.parse(postImage),
              ));
  }
}
