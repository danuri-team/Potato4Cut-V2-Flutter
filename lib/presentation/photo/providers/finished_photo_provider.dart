import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

final finishedPhotoProvider =
    StateNotifierProvider<FinishedPhotoNotifier, File?>(
      (ref) => FinishedPhotoNotifier(),
    );

class FinishedPhotoNotifier extends StateNotifier<File?> {
  FinishedPhotoNotifier() : super(null);

  Future<Uint8List> captureImage(
    GlobalKey key, {
    double pixelRatio = 4.0,
  }) async {
    if (state != null) {
      return await state!.readAsBytes();
    }

    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final formatDate = DateFormat("yyyy.MM.dd.HH.mm").format(DateTime.now());
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/finished_$formatDate.png');
    await file.writeAsBytes(pngBytes);

    state = file;
    return pngBytes;
  }

  Future<int> generateFinishedPhoto(GlobalKey key) async {
    await captureImage(key, pixelRatio: 2);
    final fileSize = state?.lengthSync() ?? 0;
    return fileSize;
  }

  void resetState() {
    state = null;
  }
}
