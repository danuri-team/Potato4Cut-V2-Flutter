import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider =
    StateNotifierProvider<CameraControllerNotifier, CameraController?>(
      (ref) => CameraControllerNotifier(),
    );

class CameraControllerNotifier extends StateNotifier<CameraController?> {
  CameraControllerNotifier() : super(null);

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();

      final controller = CameraController(
        cameras.length > 1 ? cameras[1] : cameras[0],
        ResolutionPreset.max,
        enableAudio: true,
        
      );

      await controller.initialize();
      state = controller;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<XFile> takePicture() async {
    if (state == null || !state!.value.isInitialized) {
      throw Exception('state == null or controller not isInitialized');
    }
    return await state!.takePicture();
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}
