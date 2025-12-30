import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/domain/frame/entities/response/frame_products_list_response_entity.dart';
import 'package:potato_4cut_v2/presentation/view_models/frame_view_model.dart';

enum MadedFrameStatus {
  loading,
  success,
  error,
}

class MadedFrameState {
  final MadedFrameStatus status;
  final List<FrameProcutContentEntity> frames;
  final String? errorMessage;

  const MadedFrameState({
    this.status = MadedFrameStatus.loading,
    this.frames = const [],
    this.errorMessage,
  });

  MadedFrameState copyWith({
    MadedFrameStatus? status,
    List<FrameProcutContentEntity>? frames,
    String? errorMessage,
  }) {
    return MadedFrameState(
      status: status ?? this.status,
      frames: frames ?? this.frames,
      errorMessage: errorMessage,
    );
  }
}

final madedFrameProvider = StateNotifierProvider<MadedFrameNotifier, MadedFrameState>((ref) {
  final frameViewModel = ref.watch(frameViewModelProvider.notifier);
  return MadedFrameNotifier(frameViewModel);
});

class MadedFrameNotifier extends StateNotifier<MadedFrameState> {
  final FrameViewModelNotifier _frameViewModel;

  MadedFrameNotifier(this._frameViewModel) : super(const MadedFrameState());

  Future<void> fetchMadedFrames() async {
    state = state.copyWith(
      status: MadedFrameStatus.loading,
      errorMessage: null,
    );

    try {
      final response = await _frameViewModel.madedFrame();

      state = state.copyWith(
        status: MadedFrameStatus.success,
        frames: response.data.content,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: MadedFrameStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() {
    state = const MadedFrameState();
  }
}
