import 'package:animagieeui/config/colorconfig.dart';

import '../allConstents/color_constants.dart';
import '../chat_provider.dart';
import 'package:flutter/material.dart';

class ReplyMessageWidget extends StatelessWidget {
  final String peerName;
  final String message;
  final int type;
  final VoidCallback onCancelReply;

  const ReplyMessageWidget(
      {Key? key,
      required this.message,
      required this.peerName,
      required this.type,
      required this.onCancelReply})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: buildReplyMessage(context),
            )
          ],
        ),
      );

  Widget buildReplyMessage(context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: mediaQuery.width * 0.02),
                child: Text(
                  peerName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (onCancelReply != null)
              GestureDetector(
                onTap: onCancelReply,
                child: Icon(
                  Icons.close,
                  color: animagiee_CL,
                  size: mediaQuery.width * 0.05,
                ),
              )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if (type == TypeMessage.text)
          Container(
            margin: EdgeInsets.only(
                top: mediaQuery.width * 0.01,
                bottom: mediaQuery.width * 0.01,
                left: mediaQuery.width * 0.01,
                right: mediaQuery.width * 0.09),
            padding: EdgeInsets.all(mediaQuery.width * 0.02),
            decoration: BoxDecoration(
              color: const Color(0xffDCDCDC),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(mediaQuery.width * 0.035),
                  topRight: Radius.circular(mediaQuery.width * 0.035),
                  bottomRight: Radius.circular(mediaQuery.width * 0.035)),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        if (type == TypeMessage.image)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: mediaQuery.width * 0.035),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(mediaQuery.width * 0.035)),
                  child: Image.network(
                    message,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.greyColor2,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              mediaQuery.width * 0.035,
                            ),
                          ),
                        ),
                        // width: 50,
                        height: mediaQuery.width * 0.17,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorConstants.themeColor,
                            value: loadingProgress.expectedTotalBytes != null &&
                                    loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      return Material(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/img_not_available.jpeg',
                          // width: 40,
                          height: mediaQuery.width * 0.17,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    // width: mediaQuery.width * 0.25,
                    height: mediaQuery.width * 0.17,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Image',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color(
                            0xffC4C4C4,
                          ),
                          fontSize: mediaQuery.width * 0.03),
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.01,
                    ),
                    Icon(
                      Icons.image,
                      color: const Color(
                        0xffC4C4C4,
                      ),
                      size: mediaQuery.width * 0.06,
                    ),
                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
