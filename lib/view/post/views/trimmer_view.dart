import 'dart:developer';
import 'dart:io';
import 'package:animagie_video_editor/bemeli_editor.dart';
import 'package:animagieeui/config/colorconfig.dart';
import 'package:animagieeui/config/size_config.dart';
import 'package:animagieeui/config/text_styles.dart';
import 'package:animagieeui/view/post/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpers/helpers.dart';

//-------------------//
//VIDEO EDITOR SCREEN//
//-------------------//
class TrimmerView extends StatefulWidget {
  const TrimmerView({Key? key, required this.file, required this.duration})
      : super(key: key);

  final File file;
  final int duration;

  @override
  _TrimmerViewState createState() => _TrimmerViewState();
}

class _TrimmerViewState extends State<TrimmerView> {
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);
  final double height = 60;
  int mediaHeight = 0;
  final bool _exported = false;
  String _exportText = "";
  bool _progressVisibility = false;
  late VideoEditorController _controller;
  late VideoEditorController _endController;

  PostController controller = Get.find();

  @override
  void initState() {
    _controller = VideoEditorController.file(widget.file,
        trimStyle: TrimSliderStyle(
            lineColor: Colors.black,
            iconColor: Colors.white,
            background: Colors.white.withOpacity(0.5),
            circleSize: 10),
        maxDuration: Duration(seconds: widget.duration))
      ..initialize().then((_) => setState(() {
            fetchMediaSize();
          }));

    _controller.generateDefaultCoverThumbnail();

    super.initState();
  }

  fetchMediaSize() async {
    var decodedImage = _controller.video.value.size.height.toInt();
    // controller.mediaHeight(decodedImage);
    // print('video_size-->${controller.mediaHeight}');
  }

  @override
  void dispose() {
    if (mounted) {
      _exportingProgress.dispose();
      _isExporting.dispose();
      _controller.dispose();
    }
    super.dispose();
  }

  void _exportVideo() async {
    _isExporting.value = true;

    if (_controller.isPlaying) {
      _controller.video.pause();
    }

    setState(() {
      _progressVisibility = true;
    });
    print('input_chk');

    //NOTE: To use [-crf 17] and [VideoExportPreset] you need ["min-gpl-lts"] package
    await _controller.exportVideo(
      preset: VideoExportPreset.veryfast,
      customInstruction: "-crf 28",
      onProgress: (stats, value) => _exportingProgress.value = value,
      onCompleted: (file) {
        log(file.path);
        _isExporting.value = false;
        getFileSize(file.path);
        _endController = VideoEditorController.file(file);
        _endController.getMetaData(
            onCompleted: ((metadata) => print("meta_detail->$metadata")));
        controller.imagevideo(PostFilepickerType(type: "video", url: file));
        log(controller.imagevideo.value.url!.path);
        _exportText = "Video success export!";

        setState(() {
          _progressVisibility = false;
        });

        if (mounted) {
          Navigator.pop(context, file);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bg_color34,
      appBar: AppBar(
        backgroundColor: bg_color3,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: bg_color9,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        offset: Offset(0.0, 4)),
                  ]),
              child: const Icon(
                Icons.arrow_back,
                color: bg_color4,
              )),
        ),
        elevation: 0,
        title: Text('Edit Video'.tr, style: headerStyle),
        centerTitle: true,
      ),
      body: _controller.initialized
          ? SafeArea(
              child: Stack(children: [
              Column(children: [
                _topNavBar(),
                Expanded(
                    child: DefaultTabController(
                        length: 1,
                        child: Column(children: [
                          Expanded(
                              child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Stack(alignment: Alignment.center, children: [
                                CropGridViewer(
                                  controller: _controller,
                                  showGrid: false,
                                ),
                                AnimatedBuilder(
                                  animation: _controller.video,
                                  builder: (_, __) => OpacityTransition(
                                    visible: !_controller.isPlaying,
                                    child: GestureDetector(
                                      onTap: _controller.video.play,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.play_arrow,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          )),
                          Container(
                              height: 200,
                              margin: const Margin.top(10),
                              child: Column(children: [
                                TabBar(
                                  indicatorColor: bg_color1,
                                  tabs: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                              padding: Margin.all(5),
                                              child: Icon(
                                                Icons.content_cut,
                                                color: bg_color1,
                                              )),
                                          Text(
                                            'Trim',
                                            style: TextStyle(color: bg_color1),
                                          )
                                        ]),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: _trimSlider())),
                                    ],
                                  ),
                                )
                              ])),
                          _customSnackBar(),
                          ValueListenableBuilder(
                            valueListenable: _isExporting,
                            builder: (_, bool export, __) => OpacityTransition(
                              visible: export,
                              child: AlertDialog(
                                backgroundColor: Colors.white,
                                actions: [
                                  ValueListenableBuilder(
                                      valueListenable: _exportingProgress,
                                      builder: (_, double value, __) {
                                        return Center(
                                            child: Text(
                                                '${(value * 100).toInt()} %',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)));
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: _exportingProgress,
                                      builder: (_, double value, __) {
                                        return LinearProgressIndicator(
                                          value: value,
                                          color: const Color.fromARGB(
                                              255, 255, 7, 48),
                                        );
                                      })
                                ],
                              ),
                            ),
                          )
                        ])))
              ])
            ]))
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _topNavBar() {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _progressVisibility
                    ? null
                    : _controller.rotate90Degrees(RotateDirection.left),
                child: const Icon(Icons.rotate_left),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _progressVisibility
                    ? null
                    : _controller.rotate90Degrees(RotateDirection.right),
                child: const Icon(Icons.rotate_right),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _progressVisibility ? null : _exportVideo,
                child: const Icon(
                  Icons.check,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatter(Duration duration) => [
        duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
        duration.inSeconds.remainder(60).toString().padLeft(2, '0')
      ].join(":");

  List<Widget> _trimSlider() {
    return [
      AnimatedBuilder(
        animation: _controller.video,
        builder: (_, __) {
          final duration = _controller.video.value.duration.inSeconds;

          final pos = _controller.trimPosition * duration;
          final start = _controller.minTrim * duration;
          final end = _controller.maxTrim * duration;
          final diff = end - start;

          return Padding(
              padding: Margin.horizontal(height / 4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextDesigned(formatter(Duration(seconds: start.toInt()))),
                    if (_controller.isPlaying)
                      TextDesigned(formatter(Duration(seconds: diff.ceil()))),
                    TextDesigned(
                        formatter(Duration(seconds: duration.toInt()))),
                  ]));
        },
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: Margin.vertical(height / 4),
        child: Container(
          child: TrimSlider(
              quality: 10,
              controller: _controller,
              height: height,
              horizontalMargin: height / 4,
              child: TrimTimeline(
                  controller: _controller,
                  margin: const EdgeInsets.only(top: 10))),
        ),
      )
    ];
  }

  Widget _customSnackBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SwipeTransition(
        visible: _exported,
        child: Container(
          height: height,
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
          child: Center(
            child: TextDesigned(
              _exportText,
              bold: true,
            ),
          ),
        ),
      ),
    );
  }
}

//-----------------//
//CROP VIDEO SCREEN//
//-----------------//
class CropScreen extends StatelessWidget {
  const CropScreen({Key? key, required this.controller}) : super(key: key);

  final VideoEditorController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 131, 110, 134),
      body: SafeArea(
        child: Padding(
          padding: const Margin.all(30),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.rotate90Degrees(RotateDirection.left),
                  child: const Icon(Icons.rotate_left),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      controller.rotate90Degrees(RotateDirection.right),
                  child: const Icon(Icons.rotate_right),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.goBack(),
                  child: const Icon(Icons.cancel),
                ),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () => controller.updateCrop(),
                    child: const Icon(Icons.check)),
              )
            ]),
            const SizedBox(height: 15),
            Expanded(
              child:
                  CropGridViewer(controller: controller, horizontalMargin: 60),
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              buildSplashTap("16:9", 16 / 9,
                  padding: const Margin.horizontal(10)),
              buildSplashTap("1:1", 1 / 1),
              buildSplashTap("4:5", 4 / 5,
                  padding: const Margin.horizontal(10)),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget buildSplashTap(
    String title,
    double? aspectRatio, {
    EdgeInsetsGeometry? padding,
  }) {
    return SplashTap(
      onTap: () => controller.preferredCropAspectRatio = aspectRatio,
      child: Padding(
        padding: padding ?? Margin.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.aspect_ratio, color: Colors.white),
            TextDesigned(title, bold: true),
          ],
        ),
      ),
    );
  }
}
