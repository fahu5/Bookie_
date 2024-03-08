import 'package:flutter/material.dart';

import '../Core/Helper/helpfunction.dart';

class BooksGridLayout extends StatelessWidget {
  const BooksGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent=288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust for desired number of columns
        mainAxisExtent: mainAxisExtent,
        mainAxisSpacing: HSizes.gridViewSpacing, // Spacing between items
        crossAxisSpacing: HSizes.gridViewSpacing, // Spacing between items
      ),
      itemBuilder: itemBuilder,
    );
  }
}
