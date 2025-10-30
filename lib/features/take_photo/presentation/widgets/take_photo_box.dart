import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:potato_4cut_v2/core/theme/app_color.dart';

class TakePhotoBox extends StatefulWidget {
  const TakePhotoBox({super.key});

  @override
  State<TakePhotoBox> createState() => TakePhotoBoxState();
}

class TakePhotoBoxState extends State<TakePhotoBox> {
  CameraController? cameraController;

  @override
  void dispose() {
    super.dispose();
    cameraController!.dispose();
  }

  Future<void> settingCamera() async {
    final cameras = await availableCameras();
    log('camera length = $cameras');
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: true,
    );
    await cameraController!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: settingCamera(),
      builder: (context, snapshot) {
        if (cameraController != null) {
          return Container(
            width: 343.w,
            height: 444.h,
            color: AppColor.static2,
            child: CameraPreview(cameraController!),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
