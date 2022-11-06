import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/controller/user_post_controller.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/ui/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../../utils/constants.dart';
import 'app_image.dart';

// ignore: must_be_immutable
class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key, this.isVideoCameraSelected = false, this.isLiveStream = false})
      : super(key: key);
  bool isVideoCameraSelected;
  bool isLiveStream;
  static CameraController? controller;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  VideoPlayerController? videoController;
  final userPostControl = Get.find<UserPostController>();

  File? _imageFile;
  File? _videoFile;

  FlashMode? _currentFlashMode;

  bool _isCameraInitialized = false;
  double _scale = 1.0;
  bool _isFrontCameraSelected = true;
  bool _isRecordingInProgress = false;
  List<File> allFileList = [];

  @override
  void initState() {
    onNewCameraSelected(cameras[_isFrontCameraSelected ? 1 : 0]);
    refreshAlreadyCapturedImages();
    super.initState();
  }

  @override
  void dispose() {
    CameraScreen.controller?.dispose();
    super.dispose();
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = CameraScreen.controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        CameraScreen.controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = CameraScreen.controller!.value.isInitialized;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = CameraScreen.controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = CameraScreen.controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
      return null;
    }
  }

  refreshAlreadyCapturedImages() async {
    // Get the directory
    final directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> fileList = await directory.list().toList();
    allFileList.clear();

    List<Map<int, dynamic>> fileNames = [];

    // Searching for all the image and video files using
    // their default format, and storing them
    for (var file in fileList) {
      if (file.path.contains('.jpg') || file.path.contains('.mp4')) {
        allFileList.add(File(file.path));

        String name = file.path.split('/').last.split('.').first;
        fileNames.add({0: int.parse(name), 1: file.path.split('/').last});
      }
    }

    // Retrieving the recent file
    if (fileNames.isNotEmpty) {
      final recentFile =
          fileNames.reduce((curr, next) => curr[0] > next[0] ? curr : next);
      String recentFileName = recentFile[1];
      // Checking whether it is an image or a video file
      if (recentFileName.contains('.mp4')) {
        _videoFile = File('${directory.path}/$recentFileName');
        _startVideoPlayer();
      } else {
        _imageFile = File('${directory.path}/$recentFileName');
      }

      //_imageFile = File('${directory.path}/$recentFileName');

      setState(() {});
    }
  }

  Future<void> _startVideoPlayer() async {
    if (_videoFile != null) {
      videoController = VideoPlayerController.file(_videoFile!);
      await videoController!.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        setState(() {});
      });
      await videoController!.setLooping(true);
      await videoController!.play();
      await videoController!.setVolume(0.0);
    }
  }

  Future<void> startVideoRecording() async {
    final CameraController? cameraController = CameraScreen.controller;

    if (CameraScreen.controller!.value.isRecordingVideo) {
      // A recording has already started, do nothing.
      return;
    }

    try {
      await cameraController!.startVideoRecording();
      setState(() {
        _isRecordingInProgress = true;
        debugPrint(_isRecordingInProgress.toString());
      });
    } on CameraException catch (e) {
      debugPrint('Error starting to record video: $e');
    }
  }

  Future<XFile?> stopVideoRecording() async {
    if (!CameraScreen.controller!.value.isRecordingVideo) {
      // Recording is already is stopped state
      return null;
    }

    try {
      XFile file = await CameraScreen.controller!.stopVideoRecording();
      setState(() {
        _isRecordingInProgress = false;
      });
      return file;
    } on CameraException catch (e) {
      debugPrint('Error stopping video recording: $e');
      return null;
    }
  }

  Future<void> pauseVideoRecording() async {
    if (!CameraScreen.controller!.value.isRecordingVideo) {
      // Video recording is not in progress
      return;
    }

    try {
      await CameraScreen.controller!.pauseVideoRecording();
    } on CameraException catch (e) {
      debugPrint('Error pausing video recording: $e');
    }
  }

  Future<void> resumeVideoRecording() async {
    if (!CameraScreen.controller!.value.isRecordingVideo) {
      // No video recording was in progress
      return;
    }

    try {
      await CameraScreen.controller!.resumeVideoRecording();
    } on CameraException catch (e) {
      debugPrint('Error resuming video recording: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        (_isCameraInitialized)
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColors.dark,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                  child: GestureDetector(
                    onScaleUpdate: (value) {
                      setState(() {
                        _scale = value.scale;
                      });
                    },
                    onDoubleTap: changeCamera,
                    child: Transform.scale(
                      scale: _scale,
                      child: AspectRatio(
                        aspectRatio: 1,
                        //aspectRatio: 1 / controller!.value.aspectRatio,
                        child: CameraScreen.controller!.buildPreview(),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
        shadowFullScreen(),
        Positioned(
          top: defaultPadding,
          left: defaultPadding,
          child: svgImageWithColor(
            30,
            30,
            Assets.iconsIconSetting,
            AppColors.light,
          ),
        ),
        Positioned(
          top: defaultPadding,
          left: 0,
          right: 0,
          child: Visibility(
            visible: !widget.isLiveStream,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  _currentFlashMode = (_currentFlashMode == FlashMode.off)
                      ? FlashMode.always
                      : FlashMode.off;
                });
                await CameraScreen.controller!.setFlashMode(
                  _currentFlashMode!,
                );
              },
              child: svgImageWithColor(
                30,
                30,
                (_currentFlashMode == FlashMode.off)
                    ? Assets.iconsIconFlashOff
                    : Assets.iconsIconFlashOn,
                AppColors.light,
              ),
            ),
          ),
        ),
        Positioned(
          top: defaultPadding,
          right: defaultPadding,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: svgImageWithColor(
              22,
              22,
              Assets.iconsIconCross,
              AppColors.light,
            ),
          ),
        ),
        Positioned(
          right: defaultPadding,
          bottom: defaultPadding,
          child: GestureDetector(
            onTap: () {},
            child: svgImageWithColor(
              30,
              30,
              Assets.iconsIconChangeCamera,
              AppColors.light,
            ),
          ),
        ),
        Positioned(
          bottom: defaultPadding * 4,
          right: 0,
          left: 0,
          child: InkWell(
            onTap: widget.isVideoCameraSelected
                ? () async {
                    if (_isRecordingInProgress) {
                      XFile? rawVideo = await stopVideoRecording();
                      File videoFile = File(rawVideo!.path);

                      int currentUnix = DateTime.now().millisecondsSinceEpoch;

                      final directory =
                          await getApplicationDocumentsDirectory();

                      String fileFormat = videoFile.path.split('.').last;

                      _videoFile = await videoFile.copy(
                        '${directory.path}/$currentUnix.$fileFormat',
                      );

                      _startVideoPlayer();
                    } else {
                      await startVideoRecording();
                    }
                  }
                : () async {
                    XFile? rawImage = await takePicture();
                    File imageFile = File(rawImage!.path);
                    int currentUnix = DateTime.now().millisecondsSinceEpoch;

                    final directory = await getApplicationDocumentsDirectory();

                    String fileFormat = imageFile.path.split('.').last;

                    debugPrint(fileFormat);

                    await imageFile.copy(
                      '${directory.path}/$currentUnix.$fileFormat',
                    );

                    refreshAlreadyCapturedImages();
                  },
            child: captureButton(),
          ),
        ),
        Positioned(
          bottom: defaultPadding,
          left: defaultPadding,
          child: Visibility(
            visible: !widget.isLiveStream,
            child: InkWell(
              onTap: () {
                userPostControl.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  image: (_imageFile != null)
                      ? DecorationImage(
                          image: FileImage(_imageFile!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: (videoController != null &&
                        videoController!.value.isInitialized)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: AspectRatio(
                          aspectRatio: videoController!.value.aspectRatio,
                          child: VideoPlayer(videoController!),
                        ),
                      )
                    : Container(),
              ),
            ),
          ),
        ),
      ],
    );
    //return Container();
  }

  Stack captureButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(Icons.circle, color: Colors.white, size: 95),
        const Icon(Icons.circle, color: Colors.grey, size: 85),
        const Icon(Icons.circle, color: Colors.white, size: 80),
        Visibility(
          visible: widget.isLiveStream,
          child: SizedBox(
            height: 45,
            width: 45,
            child: SvgPicture.asset(
              Assets.iconsIconStream,
            ),
          ),
        ),
      ],
    );
  }

  changeCamera() {
    setState(() {
      _isCameraInitialized = false;
    });
    onNewCameraSelected(
      cameras[_isFrontCameraSelected ? 1 : 0],
    );
    setState(() {
      _isFrontCameraSelected = !_isFrontCameraSelected;
    });
  }
}
