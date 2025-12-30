import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/domain/users/entities/response/user_photos_response_entity.dart';
import 'package:potato_4cut_v2/presentation/view_models/users_view_model.dart';

enum PhotoTakenStatus {
  loading,
  success,
  error,
}

class PhotoTakenState {
  final PhotoTakenStatus status;
  final List<UserPhotoEntity> photos;
  final String? errorMessage;

  const PhotoTakenState({
    this.status = PhotoTakenStatus.loading,
    this.photos = const [],
    this.errorMessage,
  });

  PhotoTakenState copyWith({
    PhotoTakenStatus? status,
    List<UserPhotoEntity>? photos,
    String? errorMessage,
  }) {
    return PhotoTakenState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      errorMessage: errorMessage,
    );
  }
}

final photoTakenProvider = StateNotifierProvider<PhotoTakenNotifier, PhotoTakenState>((ref) {
  final usersViewModel = ref.watch(usersProvider.notifier);
  return PhotoTakenNotifier(usersViewModel);
});

class PhotoTakenNotifier extends StateNotifier<PhotoTakenState> {
  final UsersViewModelNotifier _usersViewModel;

  PhotoTakenNotifier(this._usersViewModel) : super(const PhotoTakenState());

  Future<void> fetchPhotoTaken() async {
    state = state.copyWith(
      status: PhotoTakenStatus.loading,
      errorMessage: null,
    );

    try {
      final response = await _usersViewModel.getUserPhotos(0, 12);

      state = state.copyWith(
        status: PhotoTakenStatus.success,
        photos: response.data.content,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: PhotoTakenStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = const PhotoTakenState();
  }
}
