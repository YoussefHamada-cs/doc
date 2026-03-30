import 'package:duc/core/helper/spacing.dart';
import 'package:flutter/material.dart';

class CustomListViewVertical extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  const CustomListViewVertical({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        return verticalSpace(24);
      },
    );
  }
}
