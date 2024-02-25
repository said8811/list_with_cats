import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListViewWithCategories extends StatefulWidget {
  final double? categoryWidth;
  final double? categoryHeight;
  final double? categoriesGap;
  final bool? isColumn;
  final ItemScrollController controller;
  final ItemPositionsListener scrollListener;
  final ScrollController? categoriesController;
  final int itemsLength;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) categoryBuilder;
  const ListViewWithCategories({
    super.key,
    this.categoryWidth,
    this.categoryHeight,
    this.categoriesGap,
    this.isColumn,
    required this.controller,
    required this.scrollListener,
    required this.itemsLength,
    required this.itemBuilder,
    required this.categoryBuilder,
    this.categoriesController,
  });

  @override
  State<StatefulWidget> createState() => _ListViewWithCategoriesState();
}

class _ListViewWithCategoriesState extends State<ListViewWithCategories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isColumn ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.categoryHeight ?? 50,
            child: ListView.separated(
              separatorBuilder: (_, __) => SizedBox(
                height: widget.categoriesGap ?? 2,
              ),
              controller: widget.categoriesController,
              scrollDirection: Axis.horizontal,
              itemBuilder: widget.categoryBuilder,
              shrinkWrap: true,
              itemCount: widget.itemsLength,
            ),
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemScrollController: widget.controller,
              itemPositionsListener: widget.scrollListener,
              itemCount: widget.itemsLength,
              itemBuilder: widget.itemBuilder,
            ),
          ),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ScrollablePositionedList.builder(
            itemScrollController: widget.controller,
            itemPositionsListener: widget.scrollListener,
            itemCount: widget.itemsLength,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        SizedBox(
          width: widget.categoryWidth ?? 30,
          child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(
              height: widget.categoriesGap ?? 2,
            ),
            controller: widget.categoriesController,
            scrollDirection: Axis.vertical,
            itemBuilder: widget.categoryBuilder,
            shrinkWrap: true,
            itemCount: widget.itemsLength,
          ),
        ),
      ],
    );
  }
}
