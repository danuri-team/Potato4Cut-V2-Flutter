import 'package:potato_4cut_v2/core/enum/direction_type.dart';

abstract class LibraryRepository {
  Future getOwnedProducts(
    bool bookmarkedOnly,
    int page,
    int size,
    var sortBy,
    DirectionType direction
  );

  Future useFrame(String frameUuid);

  Future onOffFrameBookMark(String frameUuid);

  Future deleteFrame(String frameUuid);
}