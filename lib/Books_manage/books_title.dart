import 'package:flutter/material.dart';

class BooksTitle extends StatelessWidget {
  const BooksTitle({
    super.key,
    required this.title,
    required this.smallSize,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
      overflow: TextOverflow.fade,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
