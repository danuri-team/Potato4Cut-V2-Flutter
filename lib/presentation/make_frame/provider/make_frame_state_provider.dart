import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final makeFrameStateProvider =
    StateNotifierProvider<MakeFrameStateNotifier, MakeFrameState>(
      (ref) => MakeFrameStateNotifier(),
    );

class MakeFrameStateNotifier extends StateNotifier<MakeFrameState> {
  MakeFrameStateNotifier() : super(MakeFrameState());

  void setBaseFrame(File file) {
    state = state.copyWith(baseFrameFile: file);
  }

  void setOverlayFrame(File? file) {
    state = state.copyWith(overlayFrameFile: file, clearOverlay: file == null);
  }

  void setBaseFrameKey(String key) {
    state = state.copyWith(baseFrameKey: key);
  }

  void setOverlayFrameKey(String? key) {
    state = state.copyWith(overlayFrameKey: key, clearOverlayKey: key == null);
  }

  void setPreviewKey(String key) {
    state = state.copyWith(previewKey: key);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setTags(List<String> tags) {
    state = state.copyWith(tags: tags);
  }

  void setPrice(int price) {
    state = state.copyWith(price: price);
  }

  void setIsFree(bool isFree) {
    state = state.copyWith(isFree: isFree);
  }

  void setIsPublic(bool isPublic) {
    state = state.copyWith(isPublic: isPublic);
  }

  void setCategory(String category) {
    state = state.copyWith(category: category);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error, clearError: error == null);
  }

  void reset() {
    state = MakeFrameState();
  }

  bool get isStep1Valid => state.baseFrameFile != null;

  bool get isStep2Valid =>
      state.title.isNotEmpty &&
      state.description.isNotEmpty &&
      state.tags.isNotEmpty;
}

class MakeFrameState {
  final File? baseFrameFile;
  final File? overlayFrameFile;
  final String? baseFrameKey;
  final String? overlayFrameKey;
  final String? previewKey;
  final String title;
  final String description;
  final List<String> tags;
  final int price;
  final bool isFree;
  final bool isPublic;
  final String category;
  final bool isLoading;
  final String? error;

  MakeFrameState({
    this.baseFrameFile,
    this.overlayFrameFile,
    this.baseFrameKey,
    this.overlayFrameKey,
    this.previewKey,
    this.title = '',
    this.description = '',
    this.tags = const [],
    this.price = 0,
    this.isFree = true,
    this.isPublic = true,
    this.category = 'CUTE',
    this.isLoading = false,
    this.error,
  });

  MakeFrameState copyWith({
    File? baseFrameFile,
    File? overlayFrameFile,
    bool clearOverlay = false,
    String? baseFrameKey,
    String? overlayFrameKey,
    bool clearOverlayKey = false,
    String? previewKey,
    String? title,
    String? description,
    List<String>? tags,
    int? price,
    bool? isFree,
    bool? isPublic,
    String? category,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return MakeFrameState(
      baseFrameFile: baseFrameFile ?? this.baseFrameFile,
      overlayFrameFile: clearOverlay ? null : (overlayFrameFile ?? this.overlayFrameFile),
      baseFrameKey: baseFrameKey ?? this.baseFrameKey,
      overlayFrameKey: clearOverlayKey ? null : (overlayFrameKey ?? this.overlayFrameKey),
      previewKey: previewKey ?? this.previewKey,
      title: title ?? this.title,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      price: price ?? this.price,
      isFree: isFree ?? this.isFree,
      isPublic: isPublic ?? this.isPublic,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}
