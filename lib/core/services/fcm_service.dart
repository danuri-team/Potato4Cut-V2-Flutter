import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FcmService {
  final FirebaseMessaging _messaging;

  FcmService({FirebaseMessaging? messaging})
    : _messaging = messaging ?? FirebaseMessaging.instance;

  Future<String> getToken() async {
    try {
      if (Platform.isIOS) {
        await _messaging.getAPNSToken();
      }
      final token = await _messaging.getToken();
      return token ?? '';
    } catch (e) {
      return '';
    }
  }
}

final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService();
});
