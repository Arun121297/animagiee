import 'package:animagieeui/config/extension.dart';
import 'package:animagieeui/view/homepage/widgets/videoWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../config/size_config.dart';

class MediaWidget extends StatefulWidget {
  final String source;
  final String mediaType;
  const MediaWidget({
    Key? key,
    required this.mediaType,
    required this.source,
  }) : super(key: key);

  @override
  State<MediaWidget> createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        widget.mediaType == 'image'
            ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  height: 40.00.hp,
                  width: 95.00.wp,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container(
                    height: 40.00.hp,
                    width: SizeConfig.screenWidth,
                    color: Colors.black,
                    child: Center(
                        child: Transform.scale(
                      scale: 0.5,
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                        strokeWidth: 2,
                        value: progress.progress,
                      ),
                    )),
                  ),
                  fit: BoxFit.cover,
                  imageUrl: (widget.source),
                ),
              )
            : VideoWidget(videoListData: widget.source),
        /*  SizedBox(
          height: 30.0.hp,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 6.0.hp,
                    width: 9.7.wp,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          spreadRadius: 0.5)
                    ], color: Colors.white, shape: BoxShape.circle),
                    child: LikeButton(
                      like: widget.likeVisibility,
                      onClick: () {
                        widget.likeCallback();
                      },
                    ),
                  ),
                  /*   Container(
                      height: 6.0.hp,
                      width: 9.7.wp,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5,
                            spreadRadius: 0.5)
                      ], color: Colors.white, shape: BoxShape.circle),
                      child: widget.shareWidget),
                  */

                  /*  GestureDetector(
                    onTap: () {
                      widget.saveCallback();
                    },
                    child: Container(
                        height: 6.0.hp,
                        width: 9.7.wp,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0.5)
                        ], color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          widget.saveVisibility
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          size: 18.0.sp,
                        )),
                  ),
                  */

                  /*   Visibility(
                    visible: widget.followVisibility,
                    child: GestureDetector(
                      onTap: () {
                        widget.followCallback();
                      },
                      child: Container(
                        height: 6.0.hp,
                        width: 9.7.wp,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 0.5)
                        ], color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.person_add_alt,
                          color: Colors.black,
                          size: 18.0.sp,
                        ),
                      ),
                    ),
                  )
                
                 */
                ],
              ),
              SizedBox(
                width: 2.0.wp,
              )
            ],
          ),
        )
     
      */
      ],
    );
  }
}
