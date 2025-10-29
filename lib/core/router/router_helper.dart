import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RoutePath{
  RoutePath._();

  static const String splash = 'splash';
  static const String home = 'home';
  static const String takePhotoStep1 = 'take-photo-step1';
  static const String takePhotoStep2 = 'take-photo-step2';
  static const String takePhotoStep3 = 'take-photo-step3';
  static const String makeFrameStep1 = 'make-frame-step1';
  static const String makeFrameStep2 = 'make-frame-step2';
  static const String makeFrameStep3 = 'make-frame-step3';
  static const String store = 'store';
  static const String frameDetails = 'frame-details'; 
  static const String buyFrame = 'buy-frame';
  static const String gallery = 'gallery';
  static const String profile = 'profile';
  static const String profileManagement = 'profile-management';
  static const String purchaseAndProductionHistory = 'purchase-and-production-history';
}

abstract class AppNavigation{
  AppNavigation._();

  //splash
  static void goSplash(BuildContext context) => context.go(RoutePath.splash);
  
  //home
  static void goHome(BuildContext context) => context.go(RoutePath.home);

  //take a photo
  static void gotakePhotoStep1(BuildContext context) => context.push(RoutePath.takePhotoStep1); 
  static void goPhotoStep2(BuildContext context) => context.push(RoutePath.takePhotoStep2);
  static void goPhotoStep3(BuildContext context) => context.push(RoutePath.takePhotoStep3);

  //make a frame
  static void goMakeFrameStep1(BuildContext context) => context.push(RoutePath.makeFrameStep1);
  static void goMakeFrameStep2(BuildContext context) => context.push(RoutePath.makeFrameStep2);
  static void goMakeFrameStep3(BuildContext context) => context.push(RoutePath.makeFrameStep3);

  //store
  static void goStore(BuildContext context) => context.go(RoutePath.store);
  static void goFrameDetails(BuildContext context) => context.push(RoutePath.frameDetails);
  static void goBuyFrame(BuildContext context) => context.push(RoutePath.buyFrame);

  //gallery
  static void goGallery(BuildContext context) => context.go(RoutePath.gallery);

  //profile
  static void goProfile(BuildContext context) => context.go(RoutePath.profile);
  static void goProfileManagement(BuildContext context) => context.go(RoutePath.profileManagement);
  static void goPurchaseAndProductionHistory(BuildContext context) => context.go(RoutePath.purchaseAndProductionHistory);
}