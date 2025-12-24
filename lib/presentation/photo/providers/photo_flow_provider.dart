import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:potato_4cut_v2/core/enum/photo_flow_type.dart';

final photoFlowProvider = StateProvider<PhotoFlowType>(
  (ref) => PhotoFlowType.TakePhoto,
);
