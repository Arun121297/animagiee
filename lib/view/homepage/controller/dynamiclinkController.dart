import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkHomeController extends GetxController {
  var isNull = false.obs;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

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
    isNull(true);
    var productParams = createDynamicLink(
        postId: postId,
        postImage: postImage,
        postDesc: postDesc,
        postTitle: postTitle,
        refer: refer,
        singlePost: postscreen);
    var firebaseDynamicLink = await generateFirebaseDynamicLink(productParams);

    isNull(false);

    await Share.share(
        'animagie for Pets Social Media \n\nA Animagie is social media for pets lovers to share beautifull moments and memories of their pets to the world\n\n$firebaseDynamicLink');
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
