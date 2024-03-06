import 'package:flutter/material.dart';

import '../Core/Helper/helpfunction.dart';

class CategoryIcon extends StatelessWidget{
  const CategoryIcon({
    super.key, required this.image,
    required this.title,
    required this.textColor,
    this.backgroundColor= Colors.white,
    this.onTap,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final dark =HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HSizes.spacebtwitems),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 56,
              padding: const EdgeInsets.all(HSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark? Colors.black : Colors.white),
                borderRadius: BorderRadius.circular(220),
              ),
              child: Center(
                child: Image.asset(image, fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: HSizes.spacebtwitems / 2,),
            SizedBox(
              width: 55,
              child:Center(
                child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                overflow: TextOverflow.fade,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}


