import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class ShareLinks {
  String? _linkMessage;
  // bool _isCreatingLink = false;

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLinks(context) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      log("tom$uri");
      if (queryParams.isNotEmpty) {
        // RouteServices.generateRoute(queryParams);
        if (queryParams["page"] == "product") {
          String? productId = queryParams["id"];
          String? vendorId = queryParams["vId"];
          log(vendorId! + productId!);
          // Get.to(() => ProductDetailsScreen(id: productId, vendorId: vendorId));
        } else if (queryParams["page"] == "shop") {
          log(uri.toString());
          String? vendorId = queryParams["vId"];
          log(vendorId!);
          // Get.to(() => ProductDetailsShop(
          //       id: vendorId,
          //     ));
        } else {
          // Get.offAll(const DashboardScreen());
        }
        // Navigator.pushNamed(context, dynamicLinkData.link.path,
        //     arguments: {"productId": int.parse(productId!)});
      } else {
        // Get.offAll(const DashboardScreen());
        // Navigator.pushNamed(
        //   context,
        //   dynamicLinkData.link.path,
        // );
      }
    }).onError((error) {
      // print('onLink error');
      log(error.message);
    });
  }

  Future<String> _createDynamicLink({
    bool short = true,
    String id = "",
    String vendorId = "",
    String type = "",
    String image = "",
    String title = "",
  }) async {
    log(image);
    final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://animagieeui.page.link',
        link: Uri.parse('http://animagie.in/?id=$id&page=$type'),
        // : Uri.parse('http://animagie.in/?id=$id&page='),
        androidParameters: const AndroidParameters(
          packageName: 'com.app.juvee_enduser',
          minimumVersion: 1,
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: title,
          imageUrl: Uri.parse(image),
        ));

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    _linkMessage = url.toString();

    return _linkMessage!;
  }

  Future shareLink(
      {required String id,
      required String type,
      required String image,
      required String name,
      required String vendorId}) async {
    try {
      var link = await _createDynamicLink(
          id: id, image: image, type: type, vendorId: vendorId, title: name);
      await Share.share(link);
    } catch (e) {
      rethrow;
    }
  }
}
