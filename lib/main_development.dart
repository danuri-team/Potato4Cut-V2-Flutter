import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:potato_4cut_v2/app/app.dart';
import 'package:potato_4cut_v2/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken(
    vapidKey:
        'BOPmuLB7jm1wuvk40rPPltKWTzayQNdbZOWjQuzfUsQ0WpbhCFt4srlc767TIWjloka_0bpP81nkEzEB60C3jB4',
  );
  log('token = $fcmToken');

  bootstrap(() => const App());
}
