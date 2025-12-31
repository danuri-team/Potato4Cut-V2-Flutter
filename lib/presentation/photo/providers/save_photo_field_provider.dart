import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/enum/photo_share_type.dart';

class PhotoModel {
  String? frameId;
  PhotoShareType? photoShareType;
  String? expireAt;

  PhotoModel({this.frameId, this.photoShareType, this.expireAt});

  PhotoModel copyWith({
    String? frameId,
    PhotoShareType? photoShareType,
    String? expireAt,
  }) {
    return PhotoModel(
      frameId: frameId ?? this.frameId,
      photoShareType: photoShareType ?? this.photoShareType,
      expireAt: expireAt ?? this.expireAt,
    );
  }
}

final savePhotoFieldProvider =
    StateNotifierProvider<SavePHotoFieldNotifier, PhotoModel>(
      (ref) => SavePHotoFieldNotifier(),
    );

class SavePHotoFieldNotifier extends StateNotifier<PhotoModel> {
  SavePHotoFieldNotifier() : super(PhotoModel());

  void updateField({
    String? frameId,
    PhotoShareType? photoShareType,
    String? expireAt,
  }) {
    state = state.copyWith(
      frameId: frameId,
      photoShareType: photoShareType,
      expireAt: expireAt,
    );
  }

  void resetField() {
    state = PhotoModel();
  }
}
