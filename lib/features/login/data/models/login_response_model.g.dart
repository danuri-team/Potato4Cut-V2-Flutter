// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      userId: json['userId'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      role: json['role'] as String,
      token: TokenModel.fromJson(json['token'] as Map<String, dynamic>),
      newUser: json['newUser'] as bool,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'nickname': instance.nickname,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'role': instance.role,
      'token': instance.token,
      'newUser': instance.newUser,
    };
