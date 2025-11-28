import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpField {
  final String? nickname;
  final String? bio;
  final String? profilePresetId;

  const SignUpField({this.nickname, this.bio, this.profilePresetId});

  SignUpField copyWith({
    String? nickname,
    String? bio,
    String? profilePresetId,
  }) {
    return SignUpField(
      nickname: nickname ?? this.nickname,
      bio: bio ?? this.bio,
      profilePresetId: profilePresetId ?? this.profilePresetId,
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
    String? bio,
    String? profilePresetId,
  }) {
    log('nickname $nickname');
    state = state.copyWith(
      nickname: nickname,
      bio: bio,
      profilePresetId: profilePresetId,
    );
    log('state ${state.nickname}');
  }
}
