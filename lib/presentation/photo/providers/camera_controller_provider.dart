import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraControllerProvider =
    StateNotifierProvider<CameraControllerNotifier, CameraController?>(
      (ref) => CameraControllerNotifier(),
    );

class CameraControllerNotifier extends StateNotifier<CameraController?> {
  CameraControllerNotifier() : super(null);

  // 카메라 목록 캐싱
  List<CameraDescription>? _cachedCameras;

  Future<List<CameraDescription>> _getCameras() async {
    _cachedCameras ??= await availableCameras();
    return _cachedCameras!;
  }

  Future<void> initCamera() async {
    try {
      final cameras = await _getCameras();

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras[0],
      );

      final controller = CameraController(
        frontCamera,
        ResolutionPreset.max,
        enableAudio: false,
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

  Future<void> switchCamera() async {
    if (state == null) return;

      final cameras = await _getCameras();
      if (cameras.length < 2) return;

      final currentDirection = state!.description.lensDirection;
      await state!.dispose();

      final newCamera = cameras.firstWhere(
        (camera) => camera.lensDirection != currentDirection,
        orElse: () => cameras[0],
      );

      final newController = CameraController(
        newCamera,
        ResolutionPreset.max,
        enableAudio: true,
      );

      await newController.initialize();
      state = newController;
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}
