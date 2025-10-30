import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final photoListProvider =
    StateNotifierProvider<PhotoListStateNotifier, List<File>>(
      (ref) => PhotoListStateNotifier(),
    );

class PhotoListStateNotifier extends StateNotifier<List<File>> {
  PhotoListStateNotifier() : super([]);

  takePhoto(File file) {
    state = [...state, file];
  }
}
