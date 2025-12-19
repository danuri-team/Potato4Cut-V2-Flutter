class PossessionProductsResponseEntity {
  final bool success;
  final PossessionProductsDataEntity data;

  const PossessionProductsResponseEntity(this.success, this.data);
}

class PossessionProductsDataEntity {
  final List content;
  final int currentPage;
  final int pageSize;
  final int totalElements;
  final int totalPages;
  final bool first;
  final bool last;
  final bool hasNext;
  final bool hasPrevious;

  const PossessionProductsDataEntity(
    this.content,
    this.currentPage,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
    this.hasNext,
    this.hasPrevious,
  );
}
