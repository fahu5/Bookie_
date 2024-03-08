import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key,
    this.textColor,
    this.showActionButton=true,
    required this.title,
   // required this.buttonTitle,
    this.onPressed
  });

  final Color? textColor;
  final bool showActionButton;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis), // Text

         /* if (showActionButton) TextButton(
              onPressed: onPressed, child: Text(buttonTitle))*/
        ]

    );
  }
}