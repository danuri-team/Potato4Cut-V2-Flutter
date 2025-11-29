import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final photoProvider =
    StateNotifierProvider<PhotoStateNotifier, List<PhotoItem>>(
      (ref) => PhotoStateNotifier(),
    );

class PhotoStateNotifier extends StateNotifier<List<PhotoItem>> {
  PhotoStateNotifier() : super(List.generate(4, (_) => PhotoItem()));

  void takePhoto(int index, File file) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) PhotoItem(file: file) else state[i],
    ];
  }

  Future<void> importExistingPhotos(int index) async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo != null) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index) PhotoItem(file: File(photo.path)) else state[i],
      ];
    }
  }

  void confirmPhoto(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(isConfirmed: true) else state[i],
    ];
  }

  void reset() {
    state = List.generate(4, (_) => PhotoItem());
  }

  bool get allPhotosConfirmed {
    return state.every((item) => item.hasPhoto && item.isConfirmed);
  }

  int get photoCount {
    return state.where((item) => item.hasPhoto).length;
  }
}

class PhotoItem {
  final File? file;
  final bool isConfirmed;

  PhotoItem({this.file, this.isConfirmed = false});

  PhotoItem copyWith({File? file, bool? isConfirmed}) {
    return PhotoItem(
      file: file ?? this.file,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  bool get hasPhoto => file != null;
}
