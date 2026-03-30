import 'package:duc/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class CustomListViewHorizontal extends StatelessWidget {
  const CustomListViewHorizontal({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,

      scrollDirection: Axis.horizontal,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        return horizontalSpace(12);
      },
    );
  }
}
