import 'dart:io';
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

  Future<void> generateFinishedPhoto(GlobalKey key) async {
    final formatDate = DateFormat("yyyy.MM.dd.HH.mm").format(DateTime.now());

    final boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 2);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    final dir = await getApplicationDocumentsDirectory();
    final file1 = File('${dir.path}/$formatDate.png');
    final file2 = await file1.writeAsBytes(pngBytes);
    state = file2;
  }

  void resetState(){
    state = null;
  }
}
