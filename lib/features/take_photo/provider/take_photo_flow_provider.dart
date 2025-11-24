import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/enum/take_photo_flow_type.dart';

final takePhotoFlowProvider = StateProvider<TakePhotoFlowType>(
  (ref) => TakePhotoFlowType.TakePhoto,
);
