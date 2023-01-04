// import 'package:bemeli/services/dynamic_link/dynamic_link_service_new.dart';
// import 'package:bemeli_update/view/bemeli_update.dart';
import 'dart:developer';

import 'package:animagieeui/config/extension.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:helpers/helpers/transition.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoWidget extends StatefulWidget {
  final String videoListData;

  const VideoWidget({
    Key? key,
    required this.videoListData,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  late BetterPlayerController _betterPlayerController;
  bool _isDisposing = false;
  bool autoDispose = true;
  int duration = 00;
  bool retry = false;
  bool isAspected = false;
  double aspectRatio = 1;
  bool isfailed = false;
  var isDeleted = true;

  var betterPlayerConfiguration = const BetterPlayerConfiguration(
      aspectRatio: 1,
      controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: false, enableRetry: true));

  // DynamicLinkServiceNew linkService = DynamicLinkServiceNew();
  // final AdminPostController homeController = Get.find();

  @override
  void initState() {
    initVideo();
    super.initState();
  }

  initVideoHandle() {
    if (_betterPlayerController.isVideoInitialized()!) {
      _betterPlayerController.dispose(forceDispose: true);
      initVideo();
      // connectivityController.isFirst(false);
    } else {
      initVideo();
    }

    setState(() {});
  }

  initVideo() {
    log("bbbbbbbbbbbb${widget.videoListData}");
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoListData,
      useAsmsSubtitles: true,
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
          minBufferMs: 2000,
          maxBufferMs: 5000,
          bufferForPlaybackMs: 1000,
          bufferForPlaybackAfterRebufferMs: 2000),
      cacheConfiguration: BetterPlayerCacheConfiguration(
          useCache: true,
          key: widget.videoListData,
          maxCacheFileSize: 100 * 1024 * 1024,
          maxCacheSize: 1000 * 1024 * 1024,
          preCacheSize: 100 * 1024 * 1024

          ///Android only option to use cached video between app sessions

          ),
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);

    _betterPlayerController
        .setupDataSource(dataSource)
        .then((value) => _betterPlayerController.preCache(dataSource));

    _betterPlayerController.setVolume(Mute);

    _betterPlayerController.addEventsListener((BetterPlayerEvent event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.exception) {
      } else {
        double aspectRatio = (_betterPlayerController
                .videoPlayerController?.value.aspectRatio) ??
            1;

        _betterPlayerController.setOverriddenAspectRatio(aspectRatio);

        if ((_betterPlayerController.videoPlayerController!.value.duration) !=
            null) {
          duration = (_betterPlayerController
                  .videoPlayerController!.value.duration!.inSeconds) -
              _betterPlayerController
                  .videoPlayerController!.value.position.inSeconds;
        }

        if (mounted) setState(() {});
        if (duration == 0) {
          retry = true;
        } else {
          retry = false;
        }

        if (mounted) setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _isDisposing = true;
    _betterPlayerController.dispose(forceDispose: true);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoWidget oldWidget) {
    if (isDeleted) {
      isDeleted = false;
      handleVideo();
    }

    super.didUpdateWidget(oldWidget);
  }

  handleVideo() {
    if (_betterPlayerController.isVideoInitialized()!) {
      _betterPlayerController.dispose(forceDispose: true);
      initVideo();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: (_betterPlayerController.isVideoInitialized()!)
            ? Builder(builder: (context) {
                final Size size =
                    _betterPlayerController.videoPlayerController!.value.size!;
                return VisibilityDetector(
                  key: Key(_getUniqueKey()),
                  onVisibilityChanged: (visibilityInfo) {
                    onVisibilityChanged(visibilityInfo.visibleFraction);
                  },
                  child: InkWell(
                    onDoubleTap: () {
                      if ((_betterPlayerController.isPlaying()!)) {
                        _betterPlayerController.pause();
                      } else {
                        if (retry) {
                          _betterPlayerController
                              .seekTo(const Duration(seconds: 0))
                              .then((value) {
                            retry = false;
                          });
                        } else {
                          _betterPlayerController.play();
                        }
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(alignment: Alignment.center, children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    child: SizedBox(
                                        width: size.width,
                                        height: size.height.toDouble(),
                                        child: BetterPlayer(
                                          controller: _betterPlayerController,
                                        ))),
                              )),
                        ),
                        Positioned(
                          left: 2.0.hp,
                          top: 3.5.wp,
                          child: InkWell(
                            onTap: () {
                              if (_betterPlayerController
                                      .videoPlayerController!.value.volume ==
                                  0.0) {
                                _betterPlayerController.setVolume(1.0);
                                Mute = 1.0;
                              } else {
                                _betterPlayerController.setVolume(0.0);
                                Mute = 0.0;
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 3.0.hp,
                              width: 6.7.wp,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.5,
                                    spreadRadius: 0.5)
                              ], color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Mute == 0.0
                                    ? Ionicons.volume_mute
                                    : Ionicons.volume_high,
                                color: Colors.black,
                                size: 11.0.sp,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            bottom: 10,
                            child: Text(
                              "00:${duration.toString().padLeft(2, '0')}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        AnimatedBuilder(
                          animation:
                              (_betterPlayerController.videoPlayerController!),
                          builder: (_, __) => OpacityTransition(
                            visible:
                                (_betterPlayerController.isPlaying()!) == false,
                            child: InkWell(
                              onTap: () {
                                if ((_betterPlayerController.isPlaying()!)) {
                                  _betterPlayerController.pause();
                                } else {
                                  if (retry) {
                                    _betterPlayerController
                                        .seekTo(const Duration(seconds: 0))
                                        .then((value) {
                                      retry = false;
                                    });
                                  } else {
                                    _betterPlayerController.play();
                                  }
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: retry
                                    ? const Icon(Ionicons.reload_sharp,
                                        color: Colors.black)
                                    : const Icon(Ionicons.play,
                                        color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              })
            : InkWell(
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1,
                        ))),
              ));
  }

  void onVisibilityChanged(double visibleFraction) async {
    final bool isPlaying = (_betterPlayerController.isPlaying()!);

    if (visibleFraction >= 0.6) {
      if (!isPlaying && !_isDisposing) {
        _betterPlayerController.setVolume(Mute);

        Mute = (_betterPlayerController.videoPlayerController!.value.volume);

        _betterPlayerController.play();
        setState(() {});
      }
    } else {
      if (isPlaying && !_isDisposing) {
        int temp = 0;
        // await betterPlayerController.position
        //     .then((value) => temp = value!.inSeconds);
        _betterPlayerController.pause();
      }
    }
  }

  String _getUniqueKey() =>
      _betterPlayerController.betterPlayerDataSource.hashCode.toString();
}

double Mute = 0.0;
