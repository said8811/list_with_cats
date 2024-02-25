import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListScrollController {
  final ItemScrollController itemScrollController = ItemScrollController();

  void scrollTo({
    required int index,
    Duration duration = const Duration(seconds: 1),
    double alignment = 0,
  }) {
    itemScrollController.scrollTo(
        index: index, duration: duration, alignment: alignment);
  }

  void jumpTo({required int index, double alignment = 0}) {
    itemScrollController.jumpTo(index: index, alignment: alignment);
  }
}
