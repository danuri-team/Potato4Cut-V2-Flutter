import 'dart:io';

abstract class UserRepository {
  Future googleLogin();

  Future updateProfile(String nickname, String bio, File profileImage);

  Future getMyInfo();

  Future deleteAccount();

  Future getMyPhotos(int page, int size);
}