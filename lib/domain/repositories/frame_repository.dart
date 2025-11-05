import 'dart:io';

import 'package:potato_4cut_v2/core/enum/direction_type.dart';
import 'package:potato_4cut_v2/core/enum/frame_category.dart';
import 'package:potato_4cut_v2/data/models/request/add_frame_comment_request.dart';

abstract class FrameRepository {
  Future addFrame(
    String title,
    String description,
    FrameCategory category,
    List<String> tags,
    File frameImage,
    File previewImage,
  );

  Future getDetailedFrame(String frameUuid);

  Future updateFrame(
    String frameUuid,
    String title,
    String description,
    FrameCategory category,
    List<String> tags,
    File frameImage,
    File previewImage,
  );

  Future deleteFrame(String frameUuid);

  Future getFrameProductList(
    bool category,
    int page,
    int size,
    var sortBy,
    DirectionType direction,
  );

  Future searchFrame(String keyword, int page, int size);

  Future getFrameByTag(String tag, int page, int size);

  Future getMyFrame();

  Future likeItFrame(String frameUuid);

  Future cancleLikeFrame(String frameUuid);

  Future getFrameComments(String frameUuid);

  Future addFrameComment(String frameUuid, AddFrameCommentRequest request);
}
