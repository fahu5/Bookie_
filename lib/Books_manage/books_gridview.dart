import 'package:bookiee/Books_manage/RoundedImage.dart';
import 'package:bookiee/Books_manage/rounded_container.dart';
import 'package:bookiee/Core/Helper/helpfunction.dart';
import 'package:flutter/material.dart';

import 'books_title.dart';

class BooksGrids extends StatelessWidget {
  const BooksGrids({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: dark ? HColors.Dark : HColors.light,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroundColor: dark ? Colors.black : HColors.light,
              child: const Stack(
                children: [
                  RoundedImage(imageUrl: 'assets/books/The_Help.jpg', applyImageRadius: true),
                ],
              ),
            ),
            const SizedBox(height: 0.5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BooksTitle(title: 'The Help', smallSize: true),
                    const SizedBox(height: 3),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Writer Name',
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min, // Wrap the stars within available space
                      children: [
                        // Loop to create individual star icons
                        for (int i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color: i < 3 ? Colors.amber : Colors.grey, // Set color based on rating
                            size: 16,
                          ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: const SizedBox(
                            width: 32*1.2,
                            height: 32*1.2,
                            child: Center(
                              child: Icon(Icons.add, color: Colors.white),
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}



