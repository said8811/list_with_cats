import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListScrollListener {
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void listener(Function() listener) {
    itemPositionsListener.itemPositions.addListener(() {
      listener.call();
    });
  }

  Set<ListItemPosition> getVisibleItemsPositions() {
    return itemPositionsListener.itemPositions.value
        .map((e) => ListItemPosition(
            index: e.index,
            leadingEdge: e.itemLeadingEdge,
            trailingEdge: e.itemTrailingEdge))
        .toSet();
  }
}

class ListItemPosition {
  final int index;
  final double leadingEdge;
  final double trailingEdge;

  ListItemPosition({
    required this.index,
    required this.leadingEdge,
    required this.trailingEdge,
  });
}
