import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpField {
  String? nickname;
  String? profilePresetId;

  SignUpField({this.nickname, this.profilePresetId});

  SignUpField copyWith({
    String? nickname,
    String? profilePresetId,
  }) {
    return SignUpField(
      nickname: nickname,
      profilePresetId: profilePresetId,
    );
  }
}

final signUpFieldProvider =
    StateNotifierProvider<SignUpFieldNotifier, SignUpField>(
      (ref) => SignUpFieldNotifier(),
    );

class SignUpFieldNotifier extends StateNotifier<SignUpField> {
  SignUpFieldNotifier() : super(SignUpField());

  void addSignUpField({
    String? nickname,
    String? profilePresetId,
  }) {
    state = state.copyWith(
      nickname: nickname,
      profilePresetId: profilePresetId,
    );
  }

  void resetField(){
    state = state.copyWith(nickname: null, profilePresetId: null);
  }
}
